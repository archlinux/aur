# Maintainer: Walter C <bitlord@disroot.org>

pkgname="procs-git"
_pkgname="procs"
pkgver=0.8.15.400.gf85713f
pkgrel=1
pkgdesc="A modern replacement for ps written by Rust"
arch=("i686" "x86_64")
url="https://github.com/dalance/procs"
license=("MIT")
depends=()
makedepends=("rust" "cargo" "git")
provides=("procs")
conflicts=("procs")
source=("$_pkgname::git+https://github.com/dalance/procs.git")
sha384sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
