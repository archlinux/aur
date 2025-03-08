# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kirigami-addons
pkgname=kirigami-addons5
pkgver=0.11.0
pkgrel=8
pkgdesc='Add-ons for the Kirigami framework'
url='https://invent.kde.org/libraries/kirigami-addons'
arch=(x86_64)
license=(GPL LGPL)
depends=(gcc-libs
         glibc
         kirigami2
         kitemmodels5 # QML
         qt5-base
         qt5-declarative
         qt5-quickcontrols2)
makedepends=(extra-cmake-modules
             ki18n5)
conflicts=('kirigami-addons<0.11.75')
replaces=('kirigami-addons<0.11.75')
source=(https://download.kde.org/stable/$_name/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('05296c5afbe6804308bf9c0d2751f3b748b40d00fa784946d1dcdf3af4bffbad'
            'SKIP')
validpgpkeys=(0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D  # Bhushan Shah (mykolab address) <bshah@mykolab.com>
              39FFA93CAE9C6AFC212AD00202325448204E452A) # Carl Schwan <carl@carlschwan.eu>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
