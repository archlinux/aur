# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=17.07
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-library.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-9781.zip")
sha256sums=('78c66726891ae5267f36b3568b0558a1d8e5e7bb9eb7da35e1bad20f4a22f509'
            'e3af3ca4eb1ba1c4ee820343876a8be5f8c39bf69c51400a1db176a188f780a8')

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
