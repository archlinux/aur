# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=zano-appimage
pkgver=2.1.5.397
pkgrel=1
pkgdesc="Zano desktop wallet"
provides=('zano')
conflicts=('zano')
arch=('x86_64')
depends=('fuse2')
url="https://zano.org/"
options=(!strip)
_desktop_name=Zano.desktop
_filename=zano-linux-x64-release-v${pkgver}[3917d95].AppImage
source=(
  https://build.zano.org/builds/${_filename}
)
sha256sums=('3f14a69d096ebd6fe0fb385bf7532b0d51f41fe7837193917dc1d51d69c68536')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
}

package() {
  echo "Starting install"
  install -Dm755 ${_filename} "${pkgdir}"/usr/bin/Zano.AppImage
  echo "Installing desktop launcher"
  install -Dm644 ../${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/Zano.png ${pkgdir}/usr/share/pixmaps/Zano.png
}
