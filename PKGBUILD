# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=zano-appimage
pkgver=2.1.0.382
pkgrel=1
pkgdesc="Zano desktop wallet"
provides=('zano')
conflicts=('zano')
arch=('x86_64')
depends=('fuse2')
url="https://zano.org/"
options=(!strip)
_desktop_name=Zano.desktop
_filename=zano-linux-x64-release-v${pkgver}[571897a].AppImage
source=(
  https://build.zano.org/builds/${_filename}
)
sha256sums=('029018b130e3bd8581b2af6561700c8a99410fbb1f8806ec62022c3178354259')

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
