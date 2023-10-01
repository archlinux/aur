# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-launcher
pkgver=0.8
pkgrel=2
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kwindowsystem5' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/launcher/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         https://github.com/cutefishos/launcher/commit/62cb76ed.patch)
sha512sums=('c439e259bb7e82ba2dacac55f792a3d78db6c4c2c194d01a1ac0dc36ff73c632dce1accd4617bd6e693bea828951dc6a4afdb6e9ad098eced7defcae7447833b'
            '1b558d3ae774b6f6d8c3f36f83a296fdadad75c8199fa990585d13237be0ee659dce4814ae8bf2b1bae6de863a11b3d11c478da918c4a4a03754e1efa73ec8c0')

prepare() {
  cd launcher-$pkgver
  patch -p1 -i ../62cb76ed.patch # Fix build
  sed -e '/add_dependencies/d' -i CMakeLists.txt
}

build() {
  cd launcher-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
  make translations
}

package() {
  cd launcher-$pkgver
  make DESTDIR="$pkgdir" install
}
