# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=18.02
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-library.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-11331.zip")
sha256sums=('496567a9f05930b3366b38053b6de4f2c9d917280079eeb45d08581784903ca1'
            '55063566f8c887b04f280e32aa138fee2388c267bfc5e7b0f51d5cdcff54c9b4')

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
