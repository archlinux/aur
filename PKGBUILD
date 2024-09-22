# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.12.0
pkgrel=1
pkgdesc='Nervos CKB (Common Knowledge Base) command line tool'
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('51cbbaa15965b023da2241bb487f680d39f479209ac7cf890ee25d41649fe135ea14c75d7a93ec8b90e22caada218e17011b660b5f4391b8a7bdab64217fd117')
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
