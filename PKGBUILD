# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser
pkgver=2.9.2
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=('x86_64')
url="https://github.com/nodejs/http-parser"
license=('MIT')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/v$pkgver.tar.gz")
sha512sums=('fe21ba46c9297b55a6382497b689da2af88999a9a5716ffef0731057ce1bb053056e4f20147284c78338e48ed1a793a0270fe0edfe3f4b589926e3ede603d023')

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
