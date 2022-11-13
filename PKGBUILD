# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp-git
pkgver=0.2.0.r5.gb3143d6
pkgrel=1
pkgdesc="WCH ISP Tool in Rust"
arch=('any')
url="https://github.com/ch32-rs/wchisp"
license=('GPL-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip')
install=
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "${srcdir}/${pkgname%-git}/"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-git}"
}
