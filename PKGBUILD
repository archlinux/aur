# Maintainer: Walter C <bitlord@disroot.org>

pkgname="diskus-git"
_pkgname="diskus"
pkgver=0.6.0.85.g90fa0e3
pkgrel=1
pkgdesc="A command-line tool to generate, analyze, convert and manipulate colors"
arch=("i686" "x86_64" "arm" "aarch64")
url="https://github.com/sharkdp/diskus"
license=("MIT" "Apache")
depends=()
makedepends=("rust" "cargo" "git")
provides=("diskus")
conflicts=("diskus")
source=("$_pkgname::git+https://github.com/sharkdp/diskus.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    cargo build --release --locked
}
    
check() {
    cd $_pkgname
    cargo test --release --locked
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    for license in APACHE MIT
        do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"
    done
}
