# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=17.02
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "https://github.com/leozide/leocad/releases/download/v$pkgver/Library-Linux-9781.zip")
sha256sums=('5d3d00a559dc74aed4b2605a8e0ab30722b34267102c57d34d9f0c9f5369df25'
            'e3af3ca4eb1ba1c4ee820343876a8be5f8c39bf69c51400a1db176a188f780a8')

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
