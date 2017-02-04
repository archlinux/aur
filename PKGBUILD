# Maintainer: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kvpm
pkgver=0.9.10
# _pkgver=pl1
pkgrel=1
pkgdesc="Front end for Linux LVM and Gnu parted. It also handles creating and mounting file systems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kvpm/"
license=('GPL')
depends=('parted' 'kdebase-runtime' 'lvm2>=2.02.98')
makedepends=('cmake' 'automoc4')
sha256sums=('16c44cf8f7bfbe3ba1c203b7245bc43bd66da847eb138d4c2a82a706850cc41c')
install=$pkgname.install
# source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-${_pkgver}.tar.gz)
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build () {
       # cd ${srcdir}/${pkgname}-${pkgver}-${_pkgver}
       cd "${srcdir}/${pkgname}-${pkgver}"
       sed -i'' -e 's/SBIN/BIN/' kvpm/CMakeLists.txt
       mkdir -p build
       cd build
       cmake -DKDE4_ENABLE_HTMLHANDBOOK=OFF \
              -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
              -DCMAKE_BUILD_TYPE=Release ..
       make || return 1
}
package () {
       # cd ${srcdir}/${pkgname}-${pkgver}-${_pkgver}/build
       cd "${srcdir}/${pkgname}-${pkgver}/build"
       make DESTDIR=${pkgdir} install
}

