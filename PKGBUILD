# Maintainer: Henrik Bernhardt <57109108+Henriklmao@users.noreply.github.com>
pkgname=headset-tui-git
pkgver=0.2.0.r61.g8019b8a
pkgrel=1
pkgdesc='Waybar integration for HeadsetControl with an interactive TUI (git version)'
arch=('x86_64')
url='https://github.com/Henriklmao/headset-tui'
license=('GPL3')
depends=('headsetcontrol' 'git')
provides=('headset-tui')
conflicts=('headset-tui' 'headset-tui-bin')
makedepends=('cargo' 'rust' 'git')
install=headset-tui.install
source=('headset-tui::git+https://github.com/Henriklmao/headset-tui.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/headset-tui"
    local version
    version=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/headset-tui"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked
}

package() {
    cd "$srcdir/headset-tui"
    install -Dm755 "$srcdir/target/release/headset-tui" "$pkgdir/usr/bin/headset-tui"
    install -Dm755 "install-waybar-config.sh" "$pkgdir/usr/share/headset-tui/install-waybar-config.sh"
}
