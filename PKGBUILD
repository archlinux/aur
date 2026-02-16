pkgname=struct-cli
_shortPkgname=struct
pkgver="0.4.2"
pkgrel=1
pkgdesc="struct - a smarter tree command"
arch=('x86_64')
url="https://github.com/caffienerd/struct-cli"
license=('MIT')
conflicts=(struct-cli-git struct-bin)
makedepends=(cargo)
source=("struct-${pkgver}.tar.gz::https://github.com/caffienerd/struct-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('656d24667976b80f508500ed311dd6e88f822676fb4cdbe2a58f46f98e556bf8')
options=('!lto')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

}

package(){
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_shortPkgname"
}
