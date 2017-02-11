# Maintainer:  jo.mei <jo.mei@posteo.de>
# Contributor: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kvpm
pkgver=0.9.10
pkgrel=2
pkgdesc="Front end for Linux LVM and Gnu parted. It also handles creating and mounting file systems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kvpm/"
license=('GPL')
depends=('parted' 'lvm2>=2.02.98' 'kdelibs4support' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'automoc4' 'kdoctools' 'kdesignerplugin' )
sha256sums=('16c44cf8f7bfbe3ba1c203b7245bc43bd66da847eb138d4c2a82a706850cc41c')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build () {
       # cd ${srcdir}/${pkgname}-${pkgver}-${_pkgver}
       cd "${srcdir}/${pkgname}-${pkgver}"
       sed -i'' -e 's/SBIN/BIN/' kvpm/CMakeLists.txt
       mkdir -p build
       cd build
       cmake -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_BUILD_TYPE=Release ..
       make || return 1
}
package () {
       # cd ${srcdir}/${pkgname}-${pkgver}-${_pkgver}/build
       cd "${srcdir}/${pkgname}-${pkgver}/build"
       make DESTDIR=${pkgdir} install
}

