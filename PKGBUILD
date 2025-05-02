# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Maintainer: Štěpán Němec <stepnem@gmail.com>

pkgname=ubrowse
pkgver=1.10
pkgrel=1
pkgdesc='Unicode character browser for the terminal'
arch=(x86_64)
url="https://www.muppetlabs.com/~breadbox/software/$pkgname.html"
license=(MIT)
depends=(ncurses)
makedepends=(curl pkgconf python)
source=("http://www.muppetlabs.com/~breadbox/pub/software/$pkgname-$pkgver.tar.gz")
sha256sums=('3ee558758df45060a0ab8bddcb125776f341cd1db57baec57cd02fa87c7c0ab4')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CPPFLAGS $CFLAGS $(pkg-config --cflags ncursesw)" \
       LDFLAGS="$LDFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir"/usr install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 Changelog "$pkgdir"/usr/share/doc/"$pkgname"/Changelog
}
