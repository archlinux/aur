# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=libpredict-git
pkgver=r254.716419e
pkgrel=1
pkgdesc="A satellite orbit prediction library"
arch=('i686' 'x86_64')
url="https://github.com/la1k/libpredict"
license=('GPL')
provides=('libpredict')
conflicts=('libpredict')
makedepends=('cmake')
optdepends=('flyby')
source=("$pkgname::git+https://github.com/la1k/libpredict")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

