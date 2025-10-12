# Maintainer: Mjoyufull <https://github.com/Mjoyufull>

pkgname=fsel-git
pkgver=2.0.0.r0.g160ae55
pkgrel=2
pkgdesc="Fast TUI app launcher and fuzzy finder for GNU/Linux and *BSD (git version)"
arch=('x86_64')
url="https://github.com/Mjoyufull/fsel"
license=('BSD-2-Clause')
depends=()
makedepends=('cargo' 'git')
optdepends=(
    'chafa: image previews in clipboard mode'
)
provides=('fsel')
conflicts=('fsel')
source=("$pkgname::git+https://github.com/Mjoyufull/fsel.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname"
    cargo test --release --locked
}

package() {
    cd "$pkgname"
    
    # Install binary
    install -Dm755 "target/release/fsel" "$pkgdir/usr/bin/fsel"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
