# Maintainer: archlinux.info:tdy
# Contributor: RockrKnight <aquavicio[at]gmail[dot]com>

pkgname=qftp
pkgver=1.5.10
pkgrel=1
pkgdesc="A user interface for FTP file transfer"
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=qftp&full=0"
arch=(i686 x86_64)
license=(GPL2)
depends=(qt5-base)
makedepends=(cmake)
source=(http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz)
sha256sums=(c7044291e14fee5e8dec34fbed3c4e41649111e31517a208c02758146e4c300b)

prepare() {
  export LDFLAGS=-lX11
}

build() {
  cd $pkgname-$pkgver
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT5=Yes
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname-large.png "$pkgdir"/usr/share/pixmaps/$pkgname-large.png
}
