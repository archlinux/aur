# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=trust-dns-util
_pkgname=trust-dns
pkgdesc='A CLI interface for the trust-dns-resolver'
license=('MIT')
url='https://github.com/bluejekyll/trust-dns/tree/main/util'
pkgver=0.21.2
pkgrel=1
arch=('x86_64')
depends=(
)
makedepends=(
    'rust'
    'cargo'
)
source=(
    "https://github.com/bluejekyll/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('d9897e828fa7dc42f72cc8d008d40cf5c7a22de11f58a6bbfb2b1d3cae772d523e726309783cbde29dd6af075b4995d5aba4f0a229b36278c1a956a325c1252f')

build() {
    cd ${_pkgname}-${pkgver}/util
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd ${_pkgname}-${pkgver}/util
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${_pkgname}-${pkgver}/util
	install -Dt "$pkgdir/usr/bin/" target/release/resolve
}
