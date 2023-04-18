# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=trust-dns-util
_pkgname=trust-dns
pkgdesc='A CLI interface for the trust-dns-resolver'
license=('MIT')
url='https://github.com/bluejekyll/trust-dns/tree/main/util'
pkgver=0.22.0
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
sha512sums=('8cd97e83583e0772d8a9425dfb2ebfb447d5f9f253c279210d2b00085ba57bfb313ca5e3e9db1cb1ea9c0126313353d79cda7f310fe9404190fd3396c8dd8827')

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
