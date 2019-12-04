# Maintainer: Walter C <bitlord@disroot.org>

pkgname="pier-git"
_pkgname="pier"
pkgver=0.1.2.74.ge99e7ae
pkgrel=1
pkgdesc="A Linux script management CLI written in Rust"
arch=("i686" "x86_64")
url="https://github.com/BenSchZA/pier"
license=("MIT")
depends=()
makedepends=("rust" "cargo" "git")
provides=("pier")
conflicts=("pier")
source=("$_pkgname::git+https://github.com/BenSchZA/pier.git")
sha384sums=("SKIP")

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
}
