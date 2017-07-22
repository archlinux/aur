# Maintainer: Stanislav Seletskiy <s.seletskiy@gmail.com>

pkgname=konsole-cursor
_pkgname=konsole
pkgver=17.04.3
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Konsole with better cursor"
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdebase')
conflicts=('konsole')
provides=('konsole')
depends=('knotifyconfig' 'kpty' 'kparts')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
optdepends=('kdebase-keditbookmarks: to manage bookmarks')
replaces=('kdebase-konsole' 'konsole')
conflicts=('kdebase-konsole<4.14.3-2')
source=("http://download.kde.org/stable/applications/${pkgver}/src/konsole-${pkgver}.tar.xz" 
        "0001-remove-cursor-height-padding-from-top.patch")
sha1sums=('a9a99d46d17f5b49f35e84a9e5cb682658c10716'
          'f4c8e0d88c89c43b2863ced4399e6af9683271b5')

prepare() {
  mkdir -p build
  cd ${srcdir}/$_pkgname-$pkgver
  patch -Np1 -i ${srcdir}/0001-remove-cursor-height-padding-from-top.patch
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
