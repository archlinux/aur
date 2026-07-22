# Maintainer: Ellie <ellie@bm90.dev>

pkgname=qmldiff-git
_pkgname=${pkgname%-git}
pkgver=r94.25681c3
pkgrel=1
pkgdesc="A program for mass-editing QML trees"
arch=(x86_64)
url="https://github.com/asivery/qmldiff"
license=('GPL-3.0-only')
depends=(glibc libgcc)
makedepends=(git rust)
source=("git+https://github.com/asivery/$_pkgname.git")
sha256sums=('SKIP')

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

    install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
