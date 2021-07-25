# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=kilo-git
pkgver=r19.69c3ce6
pkgrel=1
pkgdesc="A small text editor in less than 1K lines of code"
arch=('x86_64')
url="https://github.com/antirez/kilo"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('kilo')
conflicts=('kilo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i "4s/$/ $CFLAGS $LDFLAGS/" Makefile
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm 755 kilo -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
