# Maintainer: honjow
pkgname=libextest-git
_pkgname=extest
pkgver=r2.40f78ed
pkgrel=1
pkgdesc="X11 XTEST reimplementation primarily for Steam Controller on Wayland"
arch=('x86_64')
url="https://github.com/Supreeeme/extest"
license=('MIT')
makedepends=('cargo' 'rustup')
provides=(libextest)
conflicts=(sk-chos-tool)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    
    rustup target add i686-unknown-linux-gnu
    cargo build --release
}

package() {
    cd "${_pkgname}"
    install -dm755 "${pkgdir}/usr/lib/"
    install -m755 "target/i686-unknown-linux-gnu/release/libextest.so" "${pkgdir}/usr/lib/libextest.so" 
}
