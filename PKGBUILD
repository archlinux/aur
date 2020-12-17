# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

pkgname="json-diff-git"
_pkgname="json-diff"
_pkgbin="json_diff"
pkgver=0.1.2.29.ga7ed330
pkgrel=1
pkgdesc="Command line utility to compare two jsons"
arch=("i686" "x86_64")
url="https://github.com/ksceriath/json-diff"
license=("UNLICENSE")
depends=()
makedepends=("rust" "cargo" "git")
provides=("json-diff")
conflicts=("json-diff")
source=("$_pkgname::git+https://github.com/ksceriath/json-diff.git")
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
    install -Dm755 target/release/$_pkgbin "$pkgdir/usr/bin/$_pkgbin"
    install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
}
