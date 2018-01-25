# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=18.01
pkgrel=2
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-library.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-10289.zip")
sha256sums=('9f10b66e8c05a8b559e11d05506d592e7c6eaad222cd6cfeb8a18aa33ee2999c'
            'd0a4f384a73b1d86cd7cfbbec4c9bc2168505a99f4ac9719316b0ee7841e7415')

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../$pkgname-$pkgver \
    INSTALL_PREFIX=/usr \
    DISABLE_UPDATE_CHECK=1
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../library.bin "$pkgdir"/usr/share/leocad/library.bin
}
