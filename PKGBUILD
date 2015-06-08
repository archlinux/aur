# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: <giacomogiorgianni at gmail dot com>

pkgname=katecpp-helper-plugin
_pkgname=KateCppHelperPlugin
pkgver=1.0.4
pkgrel=1
pkgdesc="Kate C++ Helper plugin"
arch=('i686' 'x86_64')
url="https://github.com/zaufi/kate-cpp-helper-plugin"
license=('GPL')
depends=('boost' 'clang>=3.3' 'kdesdk-kate' 'xapian-core')
makedepends=('automoc4' 'cmake')
source=("http://kde-apps.org/CONTENT/content-files/148606-${_pkgname}-${pkgver}.tar.bz2")
md5sums=('d7d21b39548bbe2e99032f718afc2c32')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
        -DBUILD_TESTING=OFF \
        -DNO_DOXY_DOCS=ON \
        -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
        "../${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
