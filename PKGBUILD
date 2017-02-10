# Maintainer: leaeasy <leaeasy at gmail.com>

pkgname=konsole-blurry
_pkgname=konsole
pkgver=16.12.2
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Konsole with blurry support"
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdebase')
conflicts=('konsole')
provides=('konsole')
depends=('knotifyconfig' 'kpty' 'kparts')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
optdepends=('kdebase-keditbookmarks: to manage bookmarks')
replaces=('kdebase-konsole')
conflicts=('kdebase-konsole<4.14.3-2')
source=("http://download.kde.org/stable/applications/${pkgver}/src/konsole-${pkgver}.tar.xz" 
        "0001-add-blur-effect-when-set-transparency.patch")
sha1sums=('d889147f592bcdd40576756a4ba3a861807cee24'
          'b3f8b444181e8e6f60d15d160375c26804429e9b')

prepare() {
  mkdir -p build
  cd ${srcdir}/$_pkgname-$pkgver
  patch -Np1 -i ${srcdir}/0001-add-blur-effect-when-set-transparency.patch
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
