# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Daniel Funke <mr.daniel.funke@gmail.com>

pkgname=libejdb
pkgver=1.2.8
pkgrel=2
pkgdesc="Embedded JSON Database engine"
arch=('i686' 'x86_64')
url="http://ejdb.org"
license=('LGPL')
depends=('zlib')
provides=('libtcejdb')
source=("https://github.com/Softmotions/ejdb/archive/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}/ejdb-${pkgver}"

    mkdir -p build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SAMPLES=OFF \
        -DPACKAGE_TGZ=OFF \
        ../

    make
}

package() {
    cd "${srcdir}/ejdb-${pkgver}/build"

    make DESTDIR="${pkgdir}" install

    mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}

# vim:set ts=4 sw=4 et:
md5sums=('f49656a3a3ba7e44dfd7f9907edb72d2')
