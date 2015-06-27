# Maintainer: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kvpm
pkgver=0.9.9
# _pkgver=pl1
pkgrel=1
pkgdesc="Front end for Linux LVM and Gnu parted. It also handles creating and mounting file systems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kvpm/"
license=('GPL')
depends=('parted' 'kdebase-runtime' 'lvm2>=2.02.98')
makedepends=('cmake' 'automoc4')
sha256sums=('97f4a2f0632f9df7a9e3731c93088ba0725d942838603cdb4a4cba53c1c02604')
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

