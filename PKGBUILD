# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Kuba Serafinowski <zizzfizzix at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse at archlinux dot us>

pkgname=libechonest-qt5
_pkgname=libechonest
pkgver=2.3.1
pkgrel=1
pkgdesc="C++ library for interfacing with Echo Nest"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/libs/libechonest'
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
source=("https://github.com/lfranchi/libechonest/archive/${pkgver}.tar.gz")
md5sums=('c4f84633d9b2dc2097078ccb0e8eb50a')

prepare() {
  rm -rf "build"
  mkdir "build"
}

build() {
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DECHONEST_BUILD_TESTS=off \
        -DBUILD_WITH_QT4=OFF \
        "../${_pkgname}-${pkgver}"
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}
