# Maintainer: enheit <roman.mahotskyi@gmail.com>
pkgname=jumper-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="A blazing fast terminal file manager with vim-like keybindings"
arch=('x86_64' 'aarch64')
url="https://github.com/enheit/jumper"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('jumper')
conflicts=('jumper')
source=("git+https://github.com/enheit/jumper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo build --release --locked --all-features
}

check() {
    cd "$srcdir/${pkgname%-git}"
    cargo test --release --locked
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Install binary
    install -Dm755 "target/release/jumper" "$pkgdir/usr/bin/jumper"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
