# Maintainer: Diego Essaya <dessaya at gmail dot com>
pkgname=waydoodle
pkgver=0.1.0
pkgrel=1
pkgdesc='A minimalistic screen annotation tool for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/dessaya/waydoodle'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/waydoodle
    install -Dm0644 assets/waydoodle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/waydoodle.svg"
    install -Dm0644 assets/waydoodle.desktop "$pkgdir/usr/share/applications/waydoodle.desktop"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
