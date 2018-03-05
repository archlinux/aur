# Maintainer: Felix Schindler <aur dot felixschindler dot net>

pkgname=alberta-wo-fem
_pkgname=alberta
pkgver=3.0.1
pkgrel=1

pkgdesc='An adaptive hierarchical finite element toolbox (grid-ony)'
arch=('i686' 'x86_64')

url='http://www.alberta-fem.de'
license=('GPL2' 'GPL3')

depends=('libtool' 'bash')

source=("http://www.mathematik.uni-stuttgart.de/fak8/ians/lehrstuhl/nmh/downloads/alberta/${_pkgname}-${pkgver}.tar.gz")

md5sums=('8211248c997fe4fe501f0831231e65f4')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # silence some warnings
    sed -i 's;info = 2;// info = 2;g' alberta/src/Common/check.c
    sed -i 's;WARNING;// WARNING;g' alberta/src/3d/macro_3d.c
}

build() {
    cd "${_pkgname}-${pkgver}"

    ./configure --prefix=/usr --libexecdir=/usr/lib \
        --disable-fem-toolbox --disable-graphics --disable-dependency-tracking --disable-debug

    make
}

package() {
    cd "${_pkgname}-${pkgver}"

    make install DESTDIR="${pkgdir}"
}
