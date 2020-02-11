# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser
pkgver=2.9.3
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=('x86_64')
url="https://github.com/nodejs/http-parser"
license=('MIT')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/v$pkgver.tar.gz")
sha512sums=('d200c52f594192ba80a8d5b59d414404843f8601dac647f29c27845db75ac1f015789031e30e91aaab5b553af1ee6af50b90f9342a444c10c1027e10fdb9a31b')

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
