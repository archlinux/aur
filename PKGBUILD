# Maintainer: ChemicalXandco <contact at chemicalxand dot co>

_pkgname="openscad-lsp"
pkgname="$_pkgname-git"
pkgver=1.2.1.97.g31761a2
pkgrel=1
pkgdesc="A LSP (Language Server Protocol) server for OpenSCAD."
arch=("i686" "x86_64")
url="https://github.com/Leathong/openscad-LSP"
license=("Apache")
depends=()
makedepends=("rust" "cargo" "git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Leathong/openscad-LSP.git")
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
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
