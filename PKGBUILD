# Maintainer: lf <packages at lfcode dot ca>

pkgname=acme-dns
pkgver=0.6
pkgrel=1
pkgdesc="DNS server for ACME dns-01 challenges"
arch=('x86_64')
url="https://github.com/joohoi/acme-dns"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=('sysusers.conf' 'tmpfiles.conf' 'acme-dns.service' "https://github.com/joohoi/acme-dns/archive/v${pkgver}.tar.gz")
sha256sums=('edd9873e5d24736b9164467f7543dab42dc177d6c98b4ca6a572dfcbdd2202a4'
            'e8a8b3ffda44a3c346925ba4de197f1b6f139bfe52b9f77e6cb3f87677d3ad98'
            '08dec87163a9cfc1b69c1762652b650d8714d8a0cc83f2d65b59adf43722dbbb'
            '0746055444873a248b2bf8459beacc0cfbed013a021695d2f3cc072492291946')

build() {
  cd "$pkgname-$pkgver"

  go build -v
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.cfg "$pkgdir/etc/acme-dns/config.cfg"
  install -Dm644 "$srcdir/acme-dns.service" "$pkgdir/usr/lib/systemd/system/acme-dns.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/acme-dns.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/acme-dns.conf"
}

# vim:set ts=2 sw=2 et:
