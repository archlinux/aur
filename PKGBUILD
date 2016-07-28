# Maintainer: PkmX <pkmx.tw@gmail.com>
pkgname=bsdconv-git
_pkgname=bsdconv
pkgver=11.4.r4.g9d91889
pkgrel=1
pkgdesc="BSD licensed charset/encoding converter library with more functionalities than libiconv"
arch=('i686' 'x86_64')
url="https://github.com/buganini/bsdconv"
license=('BSD')
depends=()
makedepends=('git')
provides=('bsdconv')
conflicts=('bsdconv')
source=("$_pkgname::git+https://github.com/buganini/bsdconv")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
