# Maintainer: Walter <wcasanova at disroot dot org>

pkgname="bottom-git"
_pkgname="bottom"
pkgver=0.4.3.791.g3ffa437
pkgrel=1
pkgdesc="Yet another cross-platform graphical process/system monitor"
arch=("i686" "x86_64")
url="https://github.com/ClementTsang/bottom"
license=("MIT")
depends=()
makedepends=("rust" "cargo" "git")
provides=("bottom")
conflicts=("bottom" "bottom-bin")
source=("$_pkgname::git+https://github.com/ClementTsang/bottom.git")
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
    install -Dm755 target/release/btm "$pkgdir/usr/bin/btm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
