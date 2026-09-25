# Maintainer: duanluan <duanluan@outlook.com>
pkgname=arch-cleaner-git
pkgver=0.1.0.r7.g9c2757f
pkgrel=1
pkgdesc='Interactive TUI cleanup tool for Arch Linux (pacman cache, journal, user/AI-agent caches, large and duplicate files)'
arch=('x86_64')
url='https://github.com/duanluan/arch-cleaner'
license=('MIT')
depends=('glibc' 'pacman-contrib' 'systemd' 'findutils')
makedepends=('cargo' 'git')
provides=('arch-cleaner')
conflicts=('arch-cleaner')
source=('arch-cleaner::git+https://github.com/duanluan/arch-cleaner.git')
sha256sums=('SKIP')

pkgver() {
    cd arch-cleaner
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd arch-cleaner
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd arch-cleaner
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd arch-cleaner
    install -Dm755 target/release/arch-cleaner "$pkgdir/usr/bin/arch-cleaner"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
