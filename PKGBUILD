# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=httping-git
pkgver=2.4.289.b1521a6
pkgrel=1
pkgdesc='A ping-like tool for http-requests'
url='https://www.vanheusden.com/httping/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('openssl' 'ncurses' 'fftw')
makedepends=('git')
provides=('httping')
conflicts=('httping')
source=(${pkgname}::git+https://github.com/flok99/httping)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed -r 's|v?(.+)|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  ./configure
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
