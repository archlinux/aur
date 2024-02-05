# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.42.0
pkgrel=1
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url='https://github.com/nextdns/nextdns'
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz" "nextdns.service")
sha256sums=('@checksum@')
options=(!lto)

build() {
  cd $pkgname-$pkgver
  go build --buildmode=pie     -trimpath     -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS"     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/nextdns.service" "$pkgdir/usr/lib/systemd/system/nextdns.service"
}

sha256sums=('893692bea9015116d6ce610c94dccf744f3aa29aeb716a15cca17dd6e6b837c1'
            'e15d83ec460562c8a81052f37c0e78e18842e95270895524b9853f7aca285eba')
