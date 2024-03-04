# Maintainer: itshog <itshog@protonmail.com>

pkgname=filtile-git
_pkgname=filtile
pkgver=r32.ec9fbe2
pkgrel=1
pkgdesc="Layout generator for river: similar to rivertile but with more features"
arch=("aarch64" "i686" "x86_64")
url="https://github.com/pkulak/filtile"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "glibc")
makedepends=("git" "cargo")
provides=("$_pkgname")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    cd "$_pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
