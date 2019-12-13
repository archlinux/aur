# Maintainer: anon at sansorgan.es
pkgname=ug
pkgver=3.13.0
pkgrel=1
pkgdesc='Numerical solution of PDEs on unstructured meshes'
url='http://www.iwr.uni-heidelberg.de/frame/iwrwikiequipment/software/ug'

arch=('i686' 'x86_64')
license=('LGPL2.1')

depends=('libxaw' 'openmpi')

source=("https://gitlab.dune-project.org/${pkgname}/${pkgname}/repository/archive.tar.bz2?ref=v${pkgver}")
md5sums=('80d93c8f674d5dd07bcd7ecd91fa51fd')
build() {
    cd "${pkgname}-v${pkgver}-b192b4ced50617cfdf6a75865771cb493dac1738"

    autoreconf -ifs

    CFLAGS="-Wno-narrowing -fPIC" CXXFLAGS="-Wno-narrowing -fPIC" CC=g++ ./configure --prefix=/usr \
        --enable-dune --enable-parallel 
    make
}

package() {
    cd "${pkgname}-v${pkgver}-b192b4ced50617cfdf6a75865771cb493dac1738"

    make install DESTDIR="${pkgdir}"
}
