# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Zachary Lund <admin@computerquip.com>
# Contributor: Edward Noname <edward.81@gmail.com>
 
pkgname=libgaminggear
pkgver=0.11.0
pkgrel=2
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2
        swarm.patch)
md5sums=('83e7ddb2ba40c6f53fd7f91beb1022da'
         '997f81df70a67195aaac9397ced3a263')

prepare() {
    cd "${srcdir}/libgaminggear-${pkgver}"
    patch -p1 < "${startdir}/swarm.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DINSTALL_LIBDIR="/usr/lib" \
        -DINSTALL_CMAKE_MODULESDIR="/usr/share/cmake-3.3/Modules"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR=${pkgdir} install
}
