# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jekyll Wu <adaptee [at] gmail dot com>

pkgname=kamule
pkgver=0.91
pkgrel=1
pkgdesc="A KDE frontend for aMule"
arch=("i686" "x86_64")
url='http://kde-apps.org/content/show.php?content=150270'
license=('GPL')
depends=('amule-daemon'
         'kio'
         'kpty'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'python'
             )
source=("https://dl.opendesktop.org/api/files/download/id/1466632134/150270-${pkgname}-${pkgver}.tar.bz2")
sha1sums=('215a25efec9c487f4d14f338f251ba4e9b15f10c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

