# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.2.9
pkgrel=1
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url="https://github.com/nextdns/nextdns"
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('db5c3d73a7a8f1b3868e6d697ccac0f23df6c0dcca6190cc0806b89246ec66d1')
install=$pkgname.install

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
