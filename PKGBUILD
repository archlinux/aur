# Maintainer: Walter C <bitlord@disroot.org>

pkgname="procs-git"
_pkgname="procs"
pkgver=v0.8.14.r1.gf85713f
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
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
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
