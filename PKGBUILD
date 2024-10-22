# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.43.5
pkgrel=1
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url='https://github.com/nextdns/nextdns'
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz" "nextdns.service")
sha256sums=('@checksum@')
options=(!lto !buildflags)

build() {
  cd $pkgname-$pkgver
  go build --buildmode=pie     -trimpath     -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS"     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/nextdns.service" "$pkgdir/usr/lib/systemd/system/nextdns.service"
}

sha256sums=('743f64d876c2c7afdae47716af1d41a6c5ec21adae74a318e5eb9319023a38c2'
            'e15d83ec460562c8a81052f37c0e78e18842e95270895524b9853f7aca285eba')
