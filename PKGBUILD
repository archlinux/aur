# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=0.37.0
pkgrel=2
pkgdesc="Nervos CKB (Common Knowledge Base) command line tool"
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('git' 'rust')
source=("$pkgname::git+https://github.com/nervosnetwork/ckb-cli#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    # Fixes compilation error with rust 1.47.0
    # https://github.com/nervosnetwork/ckb-cli/pull/348
    cargo update --package numext-fixed-uint --precise 0.1.6
    cargo build --release
}

package() {
    cd ${pkgname}
    install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
