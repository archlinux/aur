# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=peruse
pkgver=1.80
pkgrel=4
pkgdesc='Comic book viewer and creator based on KDE Frameworks 5'
arch=('x86_64')
url='https://peruse.kde.org/'
license=('LGPL2.1')
depends=('baloo' 'kconfig' 'kiconthemes' 'kio-extras' 'knewstuff'
         'kirigami2' 'plasma-framework' 'qt5-graphicaleffects')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
optdepends=('okular: for cbr, cb*, pdf, deja-vu, epub file support')
provides=('peruse')
conflicts=('peruse-git')
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('c674959ca176d236f1568156e35036d8d65655952bcbf17b1be4ece4d2ba3351')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR=$pkgdir install
}

