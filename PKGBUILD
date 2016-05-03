# Maintainer: Alad Wenter
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=jshon-git
pkgver=r84.783d3bf
pkgrel=2
pkgdesc="A json parser for the shell."
arch=('i686' 'x86_64')
url="http://kmkeen.com/jshon/"
license=('MIT')
depends=('jansson')
makedepends=('git')
provides=('jshon')
conflicts=('jshon')
source=("$pkgname::git+https://github.com/keenerd/jshon")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i 's/_pbpst/_jshon/' Makefile
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 jshon.1 "$pkgdir/usr/share/man/man1/jshon.1"
  install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/jshon/LICENSE"
}
