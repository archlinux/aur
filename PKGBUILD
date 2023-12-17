# Maintainer: Hmgle <dustgle@gmail.com>

pkgname=graftcp
pkgver=0.7.1
pkgrel=1
pkgdesc="A flexible tool for redirecting a given program's TCP traffic to SOCKS5 or HTTP proxy."
arch=('x86_64')
url="https://github.com/hmgle/graftcp"
license=('GPL3')
depends=('glibc')
makedepends=('go' 'gcc' 'make')
backup=('etc/graftcp-local/graftcp-local.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hmgle/${pkgname}/archive/v${pkgver}.tar.gz"
	"graftcp-local.service")
sha256sums=('3a1b262fa0fe74b0e1b685a99f3070592fc9d809b23f5d5d53c2bc876f140b68'
         '756bd3f9bf7202b599d77a09bd08fdd3c7a44ef20e055744d1dc20d16ef1920c')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" PREFIX=/usr install
        install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 local/example-graftcp-local.conf "$pkgdir/etc/graftcp-local/graftcp-local.conf"
        install -Dm644 "$srcdir/graftcp-local.service" "$pkgdir/usr/lib/systemd/system/graftcp-local.service"
}
