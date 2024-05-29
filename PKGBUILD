# Maintainer: Darko Mesaros<d at rko dot rs>
_pkgname="bedrust"
pkgname=${_pkgname}-git
pkgver=0.7.4
pkgrel=1
pkgdesc="A command line tool to invoke and work with Large Language models on AWS, using Amazon Bedrock"
arch=("x86_64")
url="https://github.com/darko-mesaros/bedrust"
license=('MIT')
groups=()
makedepends=("rust" "cargo" "git")
provides=("bedrust")
source=("git+https://github.com/darko-mesaros/bedrust.git")
sha256sums=("SKIP")
options=(!lto !debug)

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/bedrust "$pkgdir/usr/bin/bedrust"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}"
}
