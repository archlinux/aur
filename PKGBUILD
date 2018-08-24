# $Id: PKGBUILD 325213 2018-05-30 20:19:53Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=automoc4
pkgver=0.9.88
pkgrel=9
pkgdesc="Automatic moc for Qt4"
arch=(x86_64)
url='http://www.kde.org/'
license=(custom)
depends=(qt4)
makedepends=(cmake)
source=("http://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        license.txt fix-cmake-warnings.patch)
sha256sums=('234116f4c05ae21d828594d652b4c4a052ef75727e2d8a4f3a4fb605de9e4c49'
            'd99c6d161e46c23c46f027c76c1d2e134acffb08636cd0ede2e98a4825d7ea78'
            'db3fcf5a95d7e02b97c2f90c76919210d4877dd3ca3c55aa6a367c08a466fefc')

prepare() {
  mkdir -p build

# Fix CMake warnings with newer policies
  cd $pkgname-$pkgver
  patch -p1 -i ../fix-cmake-warnings.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
