# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mpd_info_screen2
pkgver=1.6
pkgrel=1
pkgdesc="Views graphical info on MPD, the successor to mpd_info_screen, in C++"
arch=(x86_64)
url="https://github.com/Stephen-Seo/mpd_info_screen2"
license=('ISC')
depends=(glfw fontconfig)
makedepends=(git cmake)
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/Stephen-Seo/mpd_info_screen2.git#tag=${pkgver}")
sha256sums=(SKIP)

prepare() {
    cd "${pkgname}"
    cmake -S . -B BuildRel \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_EXTERNAL_GLFW=On \
        -DFORCE_DEBUG_FLAG=On
}

build() {
    make -C "${pkgname}/BuildRel"
}

check() {
    "${pkgname}/BuildRel/unittests"
}

package() {
    install -D -m 755 "${pkgname}/BuildRel/mpd_info_screen2" "${pkgdir}/usr/bin/mpd_info_screen2"
    install -D -m 644 "${pkgname}/man/mpd_info_screen2.1" "${pkgdir}/usr/share/man/man1/mpd_info_screen2.1"
}
