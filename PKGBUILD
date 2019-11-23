# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.1.8
pkgrel=1
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url="https://github.com/nextdns/nextdns"
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('aceaa6108feb86f678e3a26e1d558e99799a8e62d5bccd1af3d2c98754a0c517')
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
