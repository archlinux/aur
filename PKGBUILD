# Maintainer: Walter - "d2Nhc2Fub3ZhQGRpc3Jvb3Qub3JnCg==" - use base64 -d

pkgname="procs-git"
_pkgname="procs"
pkgver=0.11.5.667.g6456a59
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
    cargo build --release --locked --all-features --target-dir=target
 }

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
