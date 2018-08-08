# Maintainer: Michiru Saito <urihcim at gmail dot com>
pkgname=gura
pkgver=0.7.0
pkgrel=3
pkgdesc="An iterator-oriented programming language"
arch=('i686' 'x86_64')
url='http://www.gura-lang.org/'
license=('unknown')
_moddepends=('bzip2'
            'cairo'
            'curl'
            'freetype2'
            'fftw'
            'glu'
            'freeglut'
            'gmp'
            'zlib'
            'libjpeg-turbo'
            'alsa-lib'
            #'liblinear'
            #'libsvm'
            'libgl'
            'mesa'
            'libpng'
            'oniguruma'
            'sdl'
            'sdl2'
            'sqlite'
            #'tcl'
            #'tk'
            'libtiff'
            'wxgtk3'
            'expat'
            'libyaml')
depends=('readline')
makedepends=('cmake' ${_moddepends[@]})
optdepends=(${_moddepends[@]})
source=("https://github.com/gura-lang/gura/releases/download/v${pkgver}/gura-${pkgver}-src.tar.gz"
        "Value.h.patch"
        "build-modules.gura.patch"
        "wxgtk3.patch")
md5sums=('5aeb3b21a5f78bd13c2d0940f1ed31d2'
         'ef277211f12747b5504e73f011c8cb9c'
         '53597e9ab12a52468e010d2a1caa1262'
         '8f6697c526c0308a502edd6fc634177c')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/Value.h.patch"
    patch -p1 -i "${srcdir}/build-modules.gura.patch"
    patch -p1 -i "${srcdir}/wxgtk3.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    ../configure
    make
    ./build-modules
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
