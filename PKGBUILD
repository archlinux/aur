# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=fitui-git
_pkgname=fitui
pkgver=0.3.0.r0.g5d5abf5
pkgrel=1
pkgdesc='Terminal-based personal finance tracker'
arch=('x86_64' 'aarch64')
url='https://github.com/ayanchavand/FiTui'
license=('MIT')
makedepends=('cargo')
provides=('fitui')
conflicts=('fitui-git' 'fitui-bin')
options=(!lto)
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=(SKIP)


pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 'target/release/fitui' "${pkgdir}"/usr/bin/fitui
    # install -Dm644 -t "$pkgdir/usr/share/licenses/FiTui/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/FiTui/" README.md
}

# vim: ts=4 sw=4 et:
