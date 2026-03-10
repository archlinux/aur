# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ck-bin
pkgver=0.7.4
pkgrel=2
pkgdesc="Local first semantic and hybrid BM25 grep/search tool for use by AI and humans"
arch=('x86_64')
url="https://github.com/BeaconBay/ck"
license=('Apache-2.0' 'MIT')
provides=('ck')
conflicts=('ck')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BeaconBay/ck/releases/download/${pkgver}/ck-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d27b604544e9e187caa3e556c8b0dd496cfdea093f1b82661224b37d50c0287e')
options=('!debug')

latestver() {
    curl -fsSL 'https://api.github.com/repos/BeaconBay/ck/releases/latest' | jq -r '.assets[]?.name' |
    sed -nE '/^ck-[0-9.]+-x86_64-unknown-linux-gnu\.tar\.gz$/{s/^ck-//; s/-x86_64-unknown-linux-gnu\.tar\.gz$//; p;}'
}

package() {
    cd "$srcdir"

    install -Dm755 ck "$pkgdir/usr/bin/ck"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
