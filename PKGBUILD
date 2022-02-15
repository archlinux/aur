# experimental/wip: not using sys dependencies
#
# Maintainer: milkii on irc
# Creator: redtide <redtid3@gmail.com>

_pkgname="cardinal"
pkgname="${_pkgname}.lv2-git"
pkgver=r163.e111534
pkgrel=1
pkgdesc="DPF'ied build of VCVRack, allowing it to be used as an audio plugin."
url="https://github.com/DISTRHO/Cardinal"
arch=("x86_64")
license=("GPL3")
makedepends=("git")
depends=("jansson" "libarchive" "libgl" "libsamplerate" "libx11" "speexdsp")
provides=("${_pkgname}" "${_pkgname}-lv2")
conflicts=("${_pkgname}" "${_pkgname}-lv2")
source=("${_pkgname}"::"git+https://github.com/DISTRHO/Cardinal")
sha512sums=("SKIP")
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr
}
package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/" PREFIX=/usr install
    rm -rf ${pkgdir}/usr/bin
    rm -rf ${pkgdir}/usr/lib/vst
    rm -rf ${pkgdir}/usr/lib/vst3
    rm -rf ${pkgdir}/usr/share
}
