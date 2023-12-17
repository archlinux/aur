# Maintainer: Hmgle <dustgle@gmail.com>

pkgname=graftcp
pkgver=0.7.0
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
sha256sums=('926f4bf1090866c622103bd400d497b76f2f465e7e7d4bdeafa83613af23fc4c'
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
