# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ck-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="Local first semantic and hybrid BM25 grep/search tool for use by AI and humans"
arch=('x86_64')
url="https://github.com/BeaconBay/ck"
license=('Apache-2.0' 'MIT')
provides=('ck')
conflicts=('ck')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BeaconBay/ck/releases/download/${pkgver}/ck-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('93985a57b998db84d3b9b51faa251b541b4fcc16f10bb11b18f1a6753658c2ab')
options=('!debug')

latestver() {
    gh api --paginate repos/BeaconBay/ck/releases --jq '.[] | select(.prerelease == false and .draft == false) | .assets[]?.name' |
    sed -nE '/^ck-[0-9.]+-x86_64-unknown-linux-gnu\.tar\.gz$/{s/^ck-//; s/-x86_64-unknown-linux-gnu\.tar\.gz$//; p; q}'
}

package() {
    cd "$srcdir"

    install -Dm755 ck "$pkgdir/usr/bin/ck"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
