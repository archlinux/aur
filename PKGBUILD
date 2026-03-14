# Maintainer: Adrien Lenoir <adrien.lenoir42440@gmail.com>
pkgname=hyprresume
pkgver=0.2.0
pkgrel=1
pkgdesc='Session persistence daemon for Hyprland'
arch=('x86_64')
url='https://github.com/IraSkyx/hyprresume'
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
install=$pkgname.install
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53d687bc63f6d191116b72d0e02b364f77ef08499ee62b5f7521e8e74a0cd57b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
