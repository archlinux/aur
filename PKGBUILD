# Maintainer: Kawaki <dev at kanjala dot com>
_pkgname="fetchit"
pkgname="${_pkgname}-git"
pkgver=r40.4bd089b
pkgrel=1
makedepends=('cargo')
optdepends=('ttf-font-nerd: nerd font symbols')
url=https://github.com/Ruturajn/fetchit
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A system fetch tool for Linux, written in Rust. "
source=("git+$url")
license=('GPL3')
md5sums=('SKIP')


pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked
}

build() {
    cd "$_pkgname"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
