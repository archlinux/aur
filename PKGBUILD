# Maintainer: Magillos kerown gmail com
pkgname=lsfg-vk-ui-git
pkgver=r63.8ed0e11
pkgrel=1
pkgdesc="A GTK GUI for lsfg-vk - Lossless Scaling Frame Generation Configuration Tool"
arch=('x86_64')
url="https://github.com/Caliel666/lsfg-vk-ui"
license=('unknown')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'rust' 'cargo')
provides=('lsfg-vk-ui')
conflicts=('lsfg-vk-ui')
source=("${pkgname}::git+https://github.com/Caliel666/lsfg-vk-ui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "$pkgname"
    
        install -Dm755 target/release/lsfg-vk-ui "$pkgdir/usr/bin/lsfg-vk-ui"
    
        install -Dm644 resources/com.cali666.lsfg-vk-ui.desktop \
        "$pkgdir/usr/share/applications/com.cali666.lsfg-vk-ui.desktop"
    
        install -Dm644 resources/icons/lsfg-vk.png \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.cali666.lsfg-vk-ui.png"
    
        install -Dm644 resources/ui.ui \
        "$pkgdir/usr/share/lsfg-vk-ui/ui.ui"
}
