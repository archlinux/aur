# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=zano-appimage
pkgver=2.2.0.494
pkgrel=1
pkgdesc="Zano desktop wallet"
provides=('zano')
conflicts=('zano')
arch=('x86_64')
depends=('fuse2')
url="https://zano.org/"
options=(!strip)
_desktop_name=Zano.desktop
_filename=zano-linux-x64-release-v${pkgver}[5a68a95].AppImage
source=(
  https://build.zano.org/builds/${_filename}
)
sha256sums=('c5aef2126154aa0afd158618638a06726002f3d14236b893a3275807a338eb5b')

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
