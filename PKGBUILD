# Maintainer: xRipzch
pkgname=tui-kanban-git
pkgver=r1.92c3e30
pkgrel=1
pkgdesc="A simple, lightweight terminal-based kanban board built with Rust (git version)"
arch=('x86_64')
url="https://github.com/xRipzch/TUI-Kanban"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('tui-kanban')
conflicts=('tui-kanban')
source=("git+https://github.com/xRipzch/TUI-Kanban.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/TUI-Kanban"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/TUI-Kanban"
    cargo build --release --locked
}

check() {
    cd "$srcdir/TUI-Kanban"
    cargo test --release --locked
}

package() {
    cd "$srcdir/TUI-Kanban"
    install -Dm755 "target/release/tui-kanban" "$pkgdir/usr/bin/tui-kanban"
    install -Dm644 README.md "$pkgdir/usr/share/doc/tui-kanban/README.md"
}
