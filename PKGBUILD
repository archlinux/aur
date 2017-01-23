# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=0.83.2
pkgrel=2
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-9306.zip")
sha256sums=('4f532a2fca620e512b38c0526370900969e5f25d84cff300927887d147a94984'
            '65c93a613b43160cb1d2855ae54dd7d47b92410179926ab391c887faa4f98c59')

build() {
  cd $pkgname-$pkgver

  qmake-qt5 \
    INSTALL_PREFIX=/usr \
    DISABLE_UPDATE_CHECK=1
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../library.bin "$pkgdir"/usr/share/leocad/library.bin
}
