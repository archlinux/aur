# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >

pkgname="ianny-git"
_pkgname=${pkgname%-git}
pkgver=v1.0.0.r6.g9a08d80
pkgrel=1
pkgdesc="Desktop utility periodically informing the user to take breaks"
arch=("x86_64" "aarch64")
url="https://github.com/zefr0x/ianny"
license=("GPL3")
depends=("libdbus-1.so" "glibc" "gcc-libs")
makedepends=("git" "cargo" "meson")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"

    arch-meson build
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    meson compile -C build
}

package() {
    cd "${pkgname}"

    meson install -C build --destdir "${pkgdir}"
}
