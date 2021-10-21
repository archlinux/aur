# Maintainer: redtide <redtid3@gmail.com>

_pkgname="cardinal"
pkgname="${_pkgname}-git"
pkgver=r109.ede7ed7
pkgrel=1
pkgdesc="DPF'ied build of VCVRack, allowing it to be used as an audio plugin."
url="https://github.com/DISTRHO/Cardinal"
arch=("x86_64")
license=("GPL3")
makedepends=("git")
depends=("jansson" "libarchive" "libgl" "libsamplerate" "libx11" "speexdsp")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
    make
}
package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
