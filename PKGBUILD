# Maintainer: zeakz <zeakz@protonmail.com>
pkgname=tusk-launcher-git
pkgver=r189.46c1f05
pkgrel=1
pkgdesc="A Rust written GUI app launcher for wlroots tiling WMs"
arch=('x86_64')
url="https://github.com/padoruuuu/Tusk-Launcher"
license=('GPL-3.0-only')
depends=('gtk3' 'glib2')
makedepends=('git' 'rust' 'cargo')
provides=('tusk-launcher')
conflicts=('tusk-launcher')
source=("$pkgname::git+https://github.com/padoruuuu/Tusk-Launcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/Tusk-Launcher" "$pkgdir/usr/bin/tusk-launcher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
