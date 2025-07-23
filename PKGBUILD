# Maintainer: Entailz <entail-wraps0r at icloud dot com>
pkgname=walrus-git
pkgver=r3.dc605cc
pkgrel=1
pkgdesc="A highly opinionated and minimal rewrite of Pywal in Rust"
arch=('x86_64')
url="https://github.com/entailz/walrus"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('walrus')
conflicts=('walrus')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/walrus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/walrus"
    cargo build --release --locked
}

check() {
    cd "$srcdir/walrus"
    cargo test --release --locked
}

package() {
    cd "$srcdir/walrus"

    # Install the binary
    install -Dm755 target/release/walrus "$pkgdir/usr/bin/walrus"

    # Install templates
    install -dm755 "$pkgdir/usr/share/walrus/templates"
    install -Dm644 templates/* "$pkgdir/usr/share/walrus/templates/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
