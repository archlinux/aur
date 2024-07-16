# Maintainer: Eli Alarcon <vforvendettaxa at gmail dot com>

pkgname=cilo
pkgver=r4.c436f52
pkgrel=1
pkgdesc="A simple text editor in C"
arch=('x86_64')
url="https://git.gay/StrawberryPup/cilo"
license=('MPL-2.0-no-copyleft-exception')
depends=('glibc')
makedepends=('git')
source=("$pkgname::git+$url")
md6sums=('SKIP')

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
  install -Dm 755 build/cilo -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.org -t "$pkgdir/usr/share/doc/$pkgname/"
}
sha256sums=('SKIP')
