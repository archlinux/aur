# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.11.0
pkgrel=1
pkgdesc='Nervos CKB (Common Knowledge Base) command line tool'
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0cb28bb9be84757ba60c93b7e4d6db778fdba845066dd61c191392c5a74b27a828f98a68c821f730f1f1ae5dc9ed97dbe3779e9a7a6d758dc567fe7a24282d7e')
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
