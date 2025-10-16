# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=zano-appimage
pkgver=2.1.9.431
pkgrel=1
pkgdesc="Zano desktop wallet"
provides=('zano')
conflicts=('zano')
arch=('x86_64')
depends=('fuse2')
url="https://zano.org/"
options=(!strip)
_desktop_name=Zano.desktop
_filename=zano-linux-x64-release-v${pkgver}[03ce1e6].AppImage
source=(
  https://build.zano.org/builds/${_filename}
)
sha256sums=('59775a75dddbafb4b95758507b68d0c73117a59fd459ff87bfc21914d4651e40')

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
