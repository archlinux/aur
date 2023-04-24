# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=lurk
pkgdesc='A pretty (simple) alternative to strace'
license=('AGPL3')
url='https://github.com/JakWai01/lurk'
pkgver=0.2.9
pkgrel=1
arch=('x86_64')
depends=(
)
makedepends=(
    'rust'
    'cargo'
)
source=(
    "https://github.com/JakWai01/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('0dd31847b01e672c28c767f608db48e823fa4e0d15912d05fe4dd7bd241c3a1b4fbeee3f72da07c54c2217cff4a9aeff4fdbb203ea79322783ee8751fa715038')

build() {
    cd ${pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd ${pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" target/release/lurk
}
