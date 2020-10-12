# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.8.6
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

sha256sums=('957fe632020bc7e26bd01d694e3e1c2950a0d4f1e84c9d89b3dfe3d95b9607e4'
            'e15d83ec460562c8a81052f37c0e78e18842e95270895524b9853f7aca285eba')
