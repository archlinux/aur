# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami2
pkgver=5.64.0
pkgrel=2
pkgdesc='A QtQuick based components set'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(extra-cmake-modules qt5-tools qt5-doc qt5-svg kpackage doxygen)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig}
         kdebug-414003.patch::"https://cgit.kde.org/kirigami.git/patch/?id=4a9820a6")
sha256sums=('c394360e2323c55cf654d09ec762a03c47db0027e6a992646ea32d27ce8b228e'
            'SKIP'
            '36ccbafecebdcea145268df764c1c282630f28ff4bf3323eceefa1734f8c2636')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../kdebug-414003.patch # Fix crashes in systemsettings
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

