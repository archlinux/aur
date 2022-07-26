# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=lurk
pkgdesc='A pretty (simple) alternative to strace'
license=('AGPL3')
url='https://github.com/JakWai01/lurk'
pkgver=0.0.7
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
sha512sums=('7c1fff95df91ec539da192c0942478bed8c90a9ec4c23310ebddb4c93c58dc23fbfebdad9158f219d3606c5e9a2ea7e8cf75ec85cb68ac158c2905d54321fa10')

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
