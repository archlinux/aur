# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Daniel Funke <mr.daniel.funke@gmail.com>

pkgname=libejdb
pkgver=1.2.12
pkgrel=1
pkgdesc="Embedded JSON Database engine"
arch=('i686' 'x86_64')
url="http://ejdb.org"
license=('LGPL')
depends=('zlib' 'bzip2' 'xz' 'lzo')
makedepends=('cmake')
provides=('libtcejdb')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Softmotions/ejdb/archive/v${pkgver}.tar.gz")
sha256sums=('858b58409a2875eb2b0c812ce501661f1c8c0378f7756d2467a72a1738c8a0bf')

build() {
    cd "${srcdir}/ejdb-${pkgver}"

    mkdir -p build && cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_SAMPLES=OFF \
        -DPACKAGE_TGZ=OFF \
        ..

    make
}

package() {
    cd "${srcdir}/ejdb-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
