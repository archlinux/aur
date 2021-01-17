# Maintainer: Uffe Jakobsen <uffe@uffe.org>

pkgname=tl866-updater-git
_pkgname=TL866
pkgver=r215.bbc88d7
pkgrel=1
pkgdesc="Open source software for Minipro TL866 eprom programmer"
arch=('i686' 'x86_64')
url="https://github.com/radiomanV/TL866"
license=('GPL2')
depends=('qt5-base' 'libusb')
source=("git+https://github.com/radiomanV/TL866")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/TL866_Updater/QT"
  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}/TL866_Updater/QT"
  install -D --mode=0755 TL866_Updater "${pkgdir}/usr/bin/tl866-updater"
}
