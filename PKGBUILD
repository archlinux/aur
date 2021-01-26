# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.10.1
pkgrel=1
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url='https://github.com/nextdns/nextdns'
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz" "nextdns.service")
sha256sums=('@checksum@')

build() {
  cd $pkgname-$pkgver
  go build --buildmode=pie     -trimpath     -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS"     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/nextdns.service" "$pkgdir/usr/lib/systemd/system/nextdns.service"
}

sha256sums=('c2ac19510a9e58c34b3ece2a5c5ff7e991099c91c0cf4bcc4228897dd65692ba'
            '33a71435b24f2fb0844de342f7a4680c338eb74f9e61ba74a962a5d2d5224dc2')
