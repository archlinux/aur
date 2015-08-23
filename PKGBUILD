# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Kuba Serafinowski <zizzfizzix at gmail dot com>

pkgname=tomahawk-qt5
_pkgname=tomahawk
pkgver=0.8.4
pkgrel=3
pkgdesc="A Music Player App written in C++/Qt5"
arch=('i686' 'x86_64')
url='http://tomahawk-player.org/'
license=('GPL3')
depends=('attica-qt5' 'gnutls' 'libechonest-qt5' 'liblastfm-qt5' 'lucene++'
         'phonon-qt5' 'qca-qt5' 'qt5-svg' 'qt5-webkit' 'qtkeychain-qt5' 'quazip-qt5'
         'taglib')
makedepends=('boost' 'cmake' 'sparsehash' 'qt5-tools')
optdepends=('telepathy-qt5: integration with Telepathy')
provides=('tomahawk')
conflicts=('tomahawk')
install="${_pkgname}.install"
source=("http://download.tomahawk-player.org/${_pkgname}-${pkgver}.tar.bz2"
        "arch-build.patch")
md5sums=('04832abe1786edcc55805875b5882445'
         '7d17c93e6d9959253498eddc3ffc046f')

prepare() {
  rm -rf "build"
  mkdir "build"

  patch -p0 -i "arch-build.patch"
}

build() {
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_WITH_QT4=OFF \
        -DBUILD_HATCHET=OFF \
        "../${_pkgname}-${pkgver}"
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}
