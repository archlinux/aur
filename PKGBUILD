# Maintainer: Hmgle <dustgle@gmail.com>

pkgname=graftcp
pkgver=0.7.3
pkgrel=1
pkgdesc="A flexible tool for redirecting a given program's TCP traffic to SOCKS5 or HTTP proxy."
arch=('x86_64')
url="https://github.com/hmgle/graftcp"
license=('GPL3')
depends=('glibc')
makedepends=('go' 'gcc' 'make' 'pkgconf')
backup=('etc/graftcp-local/graftcp-local.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hmgle/${pkgname}/archive/v${pkgver}.tar.gz"
	"graftcp-local.service")
sha256sums=('9c122862f48bbb2d585e9c5936f4cb0efe7c5b011fe06d6b6e39d7a1b774bcfd'
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
