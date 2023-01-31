# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=kstars-git
pkgver=cdd7568db
pkgrel=1
epoch=1
pkgdesc='Desktop Planetarium'
url='https://kde.org/applications/education/kstars/'
arch=(x86_64)
license=(GPL LGPL FDL)
depends=(stellarsolver libraw kplotting knewstuff knotifyconfig qt5-datavis3d qt5-quickcontrols qt5-websockets qtkeychain
         libindi breeze-icons hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools eigen)
optdepends=('xplanet: XPlanet support')
source=(git+https://github.com/KDE/kstars)
md5sums=('SKIP')
provides=(kstars)
conflicts=(kstars)

pkgver() {
  cd kstars
  #git describe --long --tags | sed 's/-/./;s/-/./'
  git rev-parse --short HEAD
}


build() {
  cmake -B build -S kstars \
    -DBUILD_TESTING=OFF \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
