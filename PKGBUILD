# Maintainer: Hmgle <dustgle@gmail.com>

pkgname=graftcp
pkgver=0.8.1
pkgrel=1
pkgdesc="A flexible tool for redirecting a given program's TCP traffic to SOCKS5 or HTTP proxy."
arch=('x86_64')
url="https://github.com/hmgle/graftcp"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'gcc' 'make' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hmgle/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f554c8c7724a1e3576c57628daac631a030418b41f4a3e922b9cc0641d4e9917')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make VERSION="v${pkgver}"
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make VERSION="v${pkgver}" DESTDIR="$pkgdir/" PREFIX=/usr install
        install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
        install -Dm644 README.zh-CN.md "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
        install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
        install -Dm644 example-graftcp.conf "$pkgdir/usr/share/doc/$pkgname/examples/graftcp.conf"
        install -Dm644 example-mgraftcp.conf "$pkgdir/usr/share/doc/$pkgname/examples/mgraftcp.conf"
        install -Dm644 example-blacklist-ip.txt "$pkgdir/usr/share/doc/$pkgname/examples/blacklist-ip.txt"
        install -Dm644 example-whitelist-ip.txt "$pkgdir/usr/share/doc/$pkgname/examples/whitelist-ip.txt"
}
