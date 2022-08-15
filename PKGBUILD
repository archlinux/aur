# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Maintainer: Štěpán Němec <stepnem@gmail.com>

pkgname=ubrowse
pkgver=1.6
pkgrel=1
pkgdesc='Unicode character browser for the terminal'
arch=(x86_64)
url="https://www.muppetlabs.com/~breadbox/software/$pkgname.html"
license=(MIT)
depends=(ncurses)
makedepends=(curl pkgconf python)
source=("http://www.muppetlabs.com/~breadbox/pub/software/$pkgname-$pkgver.tar.gz")
sha256sums=(f52314b5419a60f2caf9f7674c278df098792f6226b0fc4cb03880eda6d86902)

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CPPFLAGS $CFLAGS $(pkg-config --cflags ncursesw)" \
       LDFLAGS="$LDFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir"/usr install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
