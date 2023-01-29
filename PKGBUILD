# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: lf <packages at lfcode dot ca>

pkgname=acme-dns-bin
_pkgname=acme-dns
pkgver=1.0
pkgrel=1
pkgdesc="Limited DNS server with RESTful HTTP API to handle ACME DNS challenges easily and securely"
arch=('x86_64')
url="https://github.com/joohoi/acme-dns"
license=('MIT')
options=('!strip' '!emptydirs')
install=acme-dns.install
conflicts=('acme-dns')

source=('acme-dns.custom.service' 'acme-dns.sysusers' 'acme-dns.tmpfiles')
source_x86_64=("https://github.com/joohoi/acme-dns/releases/download/v$pkgver/acme-dns_${pkgver}_linux_amd64.tar.gz")

sha256sums=('848052f02c0214cc8191b8583af0fdde8d2c435013f75a3b07242df9bbe417fd'
            '15d73190853b8376f920e144ba12ffb759fa2614cdd1959e18199833273b389f'
            '889ab1f80c6da3b12c58530670741fded2e911220ee971e3d73c5bde04fd5cad')
sha256sums_x86_64=('a4bb199994bd296ed0c8e2aee35b25088f248682d463a3ae43be1c8788fb8a16')

package() {
  cd $srcdir

  install -Dm755 acme-dns "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 config.cfg "$pkgdir/etc/$_pkgname/config.cfg"
  install -Dm644 "$srcdir/acme-dns.custom.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir/acme-dns.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/acme-dns.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}

