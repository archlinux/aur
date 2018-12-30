# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: lf <packages at lfcode dot ca>

pkgname=acme-dns-bin
_pkgname=acme-dns
pkgver=0.6
pkgrel=1
pkgdesc="Limited DNS server with RESTful HTTP API to handle ACME DNS challenges easily and securely"
arch=('x86_64')
url="https://github.com/joohoi/acme-dns"
license=('MIT')
options=('!strip' '!emptydirs')
install=acme-dns.install
source=('acme-dns.custom.service' 'acme-dns.sysusers' 'acme-dns.tmpfiles')
sha256sums=(
  '848052f02c0214cc8191b8583af0fdde8d2c435013f75a3b07242df9bbe417fd'
  '31c038721ff674519a506418b0d70045e2c51115a78a5939743886c44ef5e1bb'
  '36b309e79422ddbaf6067f814c8bd69bd842cc662c3c9dbbf507ee5716282779'
)
source_x86_64=("https://github.com/joohoi/acme-dns/releases/download/v$pkgver/acme-dns_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('5db9309343ae5b2cc082b7e79af5a9c735b182956ba2d52471046ba549121dc3')

package() {
  cd $srcdir

  install -Dm755 acme-dns "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 config.cfg "$pkgdir/etc/$_pkgname/config.cfg"
  install -Dm644 "$srcdir/acme-dns.custom.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir/acme-dns.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/acme-dns.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
