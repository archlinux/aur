# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=php-kolabformat
pkgver=1.1.0
pkgrel=1
pkgdesc='PHP bindings for Kolab XML Format Schema Definitions Library'
url='http://www.kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkolabxml')
makedepends=('cmake' 'boost' 'xsd' 'qt4' 'swig')
source=("http://mirror.kolabsys.com/pub/releases/libkolabxml-${pkgver}.tar.gz")
sha256sums=('5743bc7cbee168932faeddefcea00eadddbc6eca90f39e76ca77f9a2ac53d462')

prepare() {
    mkdir build
}

build() {
    cd "${srcdir}/build"
    cmake ../libkolabxml-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DPHP_BINDINGS=true
    make
}

package() {
    cd "${srcdir}/build/src/php"

    # Install manually to avoid putting kolabformat.php in /usr/lib/php/modules
    # make DESTDIR="${pkgdir}" install
    install -Dm755 "kolabformat.so" "${pkgdir}/usr/lib/php/modules/kolabformat.so"
    install -Dm644 "kolabformat.php" "${pkgdir}/usr/share/php/kolabformat.php"
}
