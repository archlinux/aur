# Maintainer: Philip K Gisslow <ripxorip@gmail.com>

pkgname="kbd_stats-git"
_pkgname="kbd_stats"
pkgver=0.1.0.31.ge9baaad
pkgrel=1
pkgdesc="A tool to log/measure keyboard metrics"
arch=("i686" "x86_64" "arm" "aarch64")
url="https://github.com/ripxorip/kbd_stats"
license=("MIT" "Apache")
depends=()
makedepends=("rust" "cargo" "git")
provides=("kbd_stats")
conflicts=("kbd_stats")
source=("$_pkgname::git+https://github.com/ripxorip/kbd_stats.git")
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
}
