# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-repo-stats
pkgver=0.7.0
pkgrel=1
pkgdesc="Show usage statistics of repositories in pacman.conf"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-repo-stats"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('9e1f55877bcefd9543b2e99f672fdb43e496eb841f1831608596ffabd1e35fd8294fa26a88588176b45b2a1ab84c44ab8e3136f515343102643e108ed939ee28')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -vDm755 -t "$pkgdir/usr/bin" target/release/pacman-repo-stats
    install -vDm644 -t "$pkgdir/usr/share/doc/${pkgname}" README.adoc
}
