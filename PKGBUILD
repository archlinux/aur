# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ktextaddons5
_pkgname=ktextaddons
pkgver=1.5.2
pkgrel=1
pkgdesc='Various text handling addons (Qt5)'
arch=(x86_64)
license=(GPL)
url='https://invent.kde.org/libraries/ktextaddons'
depends=(gcc-libs
         glibc
         karchive5
         kconfig5
         kconfigwidgets5
         ki18n5
         kio5
         kwidgetsaddons5
         qt5-base
         qt5-speech
         qtkeychain-qt5
         sonnet5
         syntax-highlighting5)
makedepends=(doxygen
             extra-cmake-modules
             qt5-tools)
optdepends=('languagetool: Grammar checking'
            'grammalecte: French grammar checking'
            'libreoffice: Use autocorrection data from LibreOffice')
source=(https://download.kde.org/stable/$_pkgname/$_pkgname-$pkgver.tar.xz)
sha256sums=('288bbb1cefb1e8b570a383c792eba5fca291c46dd0155dbc2531f0a36684a7db')

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_DESIGNERPLUGIN=ON \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
