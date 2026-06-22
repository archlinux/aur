# Maintainer: Xander Lin <xander-lin@users.noreply.github.com>
# Contributor: screenshot-plain contributors

pkgname=screenshot-plain
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight wlroots Wayland screenshot tool — plain variant (normal screenshots, supports Niri/Hyprland/Sway/Wayfire/River)"
arch=('x86_64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
conflicts=('screenshot-niri')
source=("git+${url}.git#branch=plain")
sha256sums=('SKIP')

build() {
    cd "$srcdir/screenshot-niri"
    cargo build --release --locked
}

check() {
    cd "$srcdir/screenshot-niri"
    cargo test --release --locked
}

package() {
    cd "$srcdir/screenshot-niri"
    install -Dm755 target/release/screenshot "$pkgdir/usr/bin/screenshot-plain"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
}
