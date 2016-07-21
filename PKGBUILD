# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=ug
pkgver=3.11.0
pkgrel=1

pkgdesc='Numerical solution of PDEs on unstructured meshes'
url='http://www.iwr.uni-heidelberg.de/frame/iwrwikiequipment/software/ug'

arch=('i686' 'x86_64')
license=('LGPL2.1')

depends=('libxaw' 'openmpi')

source=("http://conan.iwr.uni-heidelberg.de/download/${pkgname}-${pkgver}.tar.gz")

md5sums=('639bc7df483d999673847119ca63f154')

build() {
    cd "${pkgname}-${pkgver}"

    autoreconf -ifs

    CFLAGS=-Wno-narrowing CXXFLAGS=-Wno-narrowing CC=g++ ./configure --prefix=/usr \
        --enable-dune --enable-parallel

    make
}

package() {
    cd "${pkgname}-${pkgver}"

    make install DESTDIR="${pkgdir}"
}
