# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.0.2
pkgrel=1
pkgdesc="A visual database applications creator"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kdb kreport ktexteditor breeze-icons)
makedepends=(extra-cmake-modules python qt5-tools marble-common libmariadbclient postgresql qt5-webkit)
optdepends=('qt5-webkit: Web browser plugin')
conflicts=(calligra-kexi)
replaces=(calligra-kexi)
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('8eaea8ba6b833d9413a05496c9099d278f0ea410cf7d2af42bfdf9125d945bba'
            'SKIP')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>


prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
