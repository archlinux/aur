# Maintainer: zeakz <zeakz@protonmail.com>
pkgname=tusk-launcher-git
pkgver=0.0.0.r78.g18e7e36
pkgrel=1
pkgdesc="A Rust written GUI app launcher for wlroots tiling WMs"
arch=('x86_64')
url="https://github.com/padoruuuu/Tusk-Launcher"
license=('GPL-3')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('tusk-launcher')
conflicts=('tusk-launcher')
source=("git+https://github.com/padoruuuu/Tusk-Launcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Tusk-Launcher"
    if git describe --tags --long 2>/dev/null; then
        git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$srcdir/Tusk-Launcher"
    cargo build --release
}

package() {
    cd "$srcdir/Tusk-Launcher"

    # Install the binary
    install -Dm755 "target/release/Tusk-Launcher" "$pkgdir/usr/bin/tusk-launcher"

    # Install documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
