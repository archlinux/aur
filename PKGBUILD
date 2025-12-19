# Maintainer: xRipzch
pkgname=omarchy-kanban-git
pkgver=r13.c6f37bf
pkgrel=1
pkgdesc="A simple terminal-based kanban board for the Omarchy Arch Community (git version)"
arch=('x86_64')
url="https://github.com/xRipzch/Omarchy-Kanban"
license=('MIT')  # Update this if you have a different license
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('omarchy-kanban')
conflicts=('omarchy-kanban')
source=("git+https://github.com/xRipzch/Omarchy-Kanban.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Omarchy-Kanban"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Omarchy-Kanban"
    cargo build --release --locked
}

check() {
    cd "$srcdir/Omarchy-Kanban"
    cargo test --release --locked
}

package() {
    cd "$srcdir/Omarchy-Kanban"
    install -Dm755 "target/release/omarchy-kanban" "$pkgdir/usr/bin/omarchy-kanban"
    install -Dm644 README.md "$pkgdir/usr/share/doc/omarchy-kanban/README.md"
}
