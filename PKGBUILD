# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=f3-git
pkgver=6.0.r22.geabf001
pkgrel=1
pkgdesc="Utilities to detect and repair counterfeit flash storage, i.e. thumb drives and memory cards with less flash than advertised"
arch=('i686' 'x86_64')
url="http://oss.digirati.com.br/f3/"
license=('GPL3')
makedepends=('git' 'parted' 'systemd')
provides=('f3')
conflicts=('f3')
source=('git+https://github.com/AltraMayor/f3.git'
        'argp.patch')
md5sums=('SKIP'
         '7ae53eace93bf711faa9abb70b10c6ae')

pkgver() {
  cd "$srcdir/f3"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/f3"
  patch < ../argp.patch
}

build() {
  cd "$srcdir/f3"
  make
  make extra
}

package() {
  cd "$srcdir/f3"
  make PREFIX="$pkgdir/usr" install
  make PREFIX="$pkgdir/usr" install-extra
}

# vim:set ts=8 sts=2 sw=2 et:
