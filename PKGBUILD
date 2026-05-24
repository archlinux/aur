# Maintainer: Cleboost <cleboost@protonmail.com>

pkgname=temper-git
pkgver=0.1.0.r44.g3726ed9f
pkgrel=1
pkgdesc="A stupidly fast open-source Minecraft server, written in Rust (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/temper-mc/temper"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("temper")
conflicts=("temper" "temper-bin")
options=(!strip)

source=("temper::git+https://github.com/temper-mc/temper.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/temper"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/temper"
    cargo fetch
}

build() {
    cd "${srcdir}/temper"
    export CARGO_HOME="${srcdir}/cargo"
    cargo build --release
}

package() {
    cd "${srcdir}/temper"
    install -Dm755 "target/release/temper" "${pkgdir}/usr/bin/temper"
}
