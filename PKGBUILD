# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.9.0
pkgrel=1
pkgdesc='Nervos CKB (Common Knowledge Base) command line tool'
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('21161831df673b804faf0de03d142d8a22244512a669bf1030e32ce20bb97f601ff10a15f48bf25ebec7d7489d1091a6d77a305e9c5caef344f98439769d062f')
options=(!lto)

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
