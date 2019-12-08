# Maintainer: Walter C <bitlord@disroot.org>

pkgname="sd-git"
_pkgname="sd"
pkgver=0.6.5.161.g03a10c1
pkgrel=1
pkgdesc="Intuitive find & replace CLI"
arch=("i686" "x86_64")
url="https://github.com/chmln/sd"
license=("MIT")
depends=()
makedepends=("rust" "cargo" "git")
provides=("sd")
conflicts=("sd")
source=("$_pkgname::git+https://github.com/chmln/sd.git")
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}