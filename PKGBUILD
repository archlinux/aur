# Maintainer: Hmgle <dustgle@gmail.com>

pkgname=graftcp
pkgver=0.3.1
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
md5sums=('2c19d80c6de8ec3a1adcb6da0569bcb5'
         '823287e2e92148db07ad6a59304dbfce')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" PREFIX=/usr install
        install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 graftcp-local/example-graftcp-local.conf "$pkgdir/etc/graftcp-local/graftcp-local.conf"
        install -Dm644 "$srcdir/graftcp-local.service" "$pkgdir/usr/lib/systemd/system/graftcp-local.service"
}
