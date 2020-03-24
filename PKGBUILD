# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser
pkgver=2.9.4
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=('x86_64')
url="https://github.com/nodejs/http-parser"
license=('MIT')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/v$pkgver.tar.gz")
sha512sums=('b45df7b94d1c51079d44687d0a7f901f44faae51df4e84c7e3fe38f130c2d809d0e7c2a146c57b3723e60732aededc246bf44eadb10a95b710963d641f9fe7cd')

prepare() {
  sed -i 's|-Werror||' $pkgname-$pkgver/Makefile
}

build() {
  cd $pkgname-$pkgver
  make library
}

check() {
  cd $pkgname-$pkgver
  make test
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname/
}
