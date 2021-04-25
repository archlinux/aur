# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=cncli
pkgdesc='A community-based cardano-node CLI tool'
license=('Apache')
url='https://github.com/AndrewWestberg/cncli'
pkgver=2.0.3
pkgrel=2
arch=('x86_64')
makedepends=('cargo')

# Can't use source release because it attempts to fetch git submodules for libsodium :-/
# "https://github.com/AndrewWestberg/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
#sha512sums=('54cf02963b570c631cd92444c3137b5d586e90784e7a231469d292785dc122386e1dd83944a35ec45c9bb6df3aec2a51686bf8a384906fa409bddb0a968a783f')
source=(
    "git+https://github.com/AndrewWestberg/cncli.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

# Notes: https://wiki.archlinux.org/index.php/Rust_package_guidelines
build() {
    cd ${pkgname}
    cargo build --release --locked --target-dir=target
}

check() {
    cd ${pkgname}
    cargo test --release --locked --target-dir=target
}

package() {
    cd ${pkgname}
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
