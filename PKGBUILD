# Maintainer: Felipe Garcia <hello@sazz.space>
pkgname="nazuna-git"
_pkgname="nazuna"
pkgver=1.0.2.17.g3aade2d
pkgrel=1
pkgdesc="Download Twitter videos using your terminal!"
arch=("i686" "x86_64")
url="https://github.com/Sazzo/nazuna"
license=("GPL3")
depends=("openssl")
makedepends=("rust" "cargo" "git")
provides=("nazuna")
conflicts=("nazuna")
source=("$_pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release --locked
}

package() {
    cd "$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"

    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}

