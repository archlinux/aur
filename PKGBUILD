# Maintainer: Walter C <bitlord {at} disroot {dot} org>

pkgname="dust-git"
_pkgname="dust"
pkgver=0.4.2.148.ga6839c0
pkgrel=1
pkgdesc="A more intuitive version of du in rust"
arch=("i686" "x86_64")
url="https://github.com/bootandy/dust"
license=("Apache")
depends=()
makedepends=("rust" "cargo" "git")
provides=("dust")
conflicts=("dust")
source=("$_pkgname::git+https://github.com/bootandy/dust.git")
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
