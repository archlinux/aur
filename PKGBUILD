# Maintainer: Hypnotron <the DOT hypnotron AT gmail DOT com>

_pkgname=sup2srt
pkgname="${_pkgname}-git"
pkgver=r128.b40c5aa
pkgrel=1
pkgdesc="Convert SUP graphic subtitles to text-based SRT format"
arch=('any')
url="https://github.com/retrontology/sup2srt"
license=('GPL-3.0-or-later')
depends=('libtiff' 'leptonica' 'tesseract' 'ffmpeg')
makedepends=('cmake' 'git')
source=("git+https://github.com/retrontology/sup2srt")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    make -C build DESTDIR="${pkgdir}" install
}
