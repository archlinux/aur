# Maintainer: honjow
pkgname=libextest-git
_pkgname=extest
pkgver=r7.c570311
pkgrel=1
pkgdesc="X11 XTEST reimplementation primarily for Steam Controller on Wayland"
arch=('x86_64')
url="https://github.com/Supreeeme/extest"
license=('MIT')
makedepends=('rustup')
provides=(libextest)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    rustup default stable
    rustup target add i686-unknown-linux-gnu
    cargo build --release --target x86_64-unknown-linux-gnu --target i686-unknown-linux-gnu
}

package() {
    cd "${_pkgname}"
    install -dm755 "${pkgdir}/usr/lib/"
    install -dm755 "${pkgdir}/usr/lib32/"
    install -m755 "target/x86_64-unknown-linux-gnu/release/libextest.so" "${pkgdir}/usr/lib/libextest.so" 
    install -m755 "target/i686-unknown-linux-gnu/release/libextest.so" "${pkgdir}/usr/lib32/libextest.so" 
}
