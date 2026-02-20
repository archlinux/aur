# Maintainer: Your Name <lucyrandall@helltop.net>
pkgname=are
pkgver=1.0.0
pkgrel=1
pkgdesc="Another Easy Editor - a simple, easy to use terminal-based screen oriented editor"
arch=('x86_64' 'i686' 'aarch64')
url="https://helltop.net/projects"
license=('custom:Artistic')
depends=('rust')
makedepends=('git' 'cargo')
provides=('aee')
conflicts=('aee')
source=("git+https://github.com/anoraktrend/are.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/aee"
    printf "2.2.22.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/aee"
    cargo build --release
}

package() {
    cd "$srcdir/aee"

    # Install the binary
    install -Dm755 "target/release/aee" "$pkgdir/usr/bin/aee"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "aee.i18n.guide" "$pkgdir/usr/share/doc/$pkgname/aee.i18n.guide"
}
