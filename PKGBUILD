# Maintainer: Nguyen Ky <nhktmdzhg at gmail dot com>
_pkgname="nmcurse"
pkgname="$_pkgname-rs-git"
epoch=1
pkgver=latest
pkgrel=1
pkgdesc="Curses interface for NetworkManager, rewritten in Rust with additional features"
arch=('any')
url="https://github.com/nhktmdzhg/nmcurse-rs"
depends=('networkmanager' 'ncurses')
makedepends=('rust')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    cargo fetch --locked
    RUSTFLAGS="-C opt-level=3 -C target-cpu=native" cargo build --release
}

package() {
    cd "$srcdir/${_pkgname}/target/release"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
