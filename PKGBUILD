# Maintainer: mojo-hakase <aur@mojo.hakase.de>

_pkgname=nvdock
pkgname="${_pkgname}-git"
pkgver=r7.1290edc
pkgrel=1
pkgdesc="a tray icon to easily launch the nvidia-settings control panel"
arch=('x86_64')
url="http://www.opsat.net/user/bob/projects/nvdock"
license=('BSD')
conflicts=('nvdock')
provides=('nvdock')
depends=('gtk2')
source=("git+https://github.com/LAKostis/nvdock")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m755 nvdock "${pkgdir}/usr/bin/nvdock"
  install -D -m644 data/nvdock.png "${pkgdir}/usr/share/pixmaps/nvdock.png"
  install -D -m644 data/nvdock.desktop "${pkgdir}/usr/share/applications/nvdock.desktop"

  # Install license
  install -D COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
