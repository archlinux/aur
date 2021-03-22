# Maintainer: redtide <redtid3@gmail.com>

_pkgname="midibench"
pkgname="${_pkgname}-git"
pkgver=15.16e806d
pkgrel=1
pkgdesc="MIDI tool for developers"
url="https://github.com/jpcima/midibench"
arch=("x86_64")
license=("Boost")
makedepends=("git" "meson")
depends=("glew" "rtmidi" "sdl2" "sdl_image")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+https://github.com/jpcima/midibench")
sha512sums=("SKIP")
pkgver() {
    cd "${pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/${pkgname}"
    meson --prefix "/usr" --buildtype=plain build
    meson compile -C build
}
package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" meson install -C build
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
