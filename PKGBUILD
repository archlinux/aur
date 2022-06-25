# Maintainer: Matt C <matt[at]getcryst[dot]al>
# Developer: axtlos <axtlos[at]salyut[dot]one>
# Developer: jnats <jnats[at]salyut[dot]one>

pkgname=ame
pkgver=3.2.0
pkgrel=1
pkgdesc="Fast, efficient and lightweight AUR helper/pacman wrapper"
arch=('x86_64')
url="https://git.tar.black/crystal/ame"
license=('GPL3')
source=("git+https://git.tar.black/crystal/programs/amethyst.git")
sha256sums=('SKIP')
depends=('git' 'binutils' 'fakeroot' 'openssl' 'sqlite')
makedepends=('cargo')
options=('!lto')

prepare() {
    cd ${srcdir}/amethyst
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target ${CARCH}-unknown-linux-gnu
}

build() {
    cd ${srcdir}/amethyst
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd ${srcdir}/amethyst
    install -Dm755 target/release/${pkgname} -t "${pkgdir}"/usr/bin
}
