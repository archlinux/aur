# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mcrecover
pkgver=0.2
pkgrel=1
pkgdesc="Utility to recover files from corrupted or reformatted GameCube memory cards (aka GCN MemCard Recover)"
arch=('i686' 'x86_64')
url="http://wiibrew.org/wiki/GCN_MemCard_Recover"
license=('GPL2')
depends=('qt4' 'libpng' 'pcre' 'hicolor-icon-theme')
makedepends=('cmake')
install=$pkgname.install
source=("http://gerbilsoft.soniccenter.org/gc-tools/$pkgname/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('6c9897553bae6794c27aab3d1978c50e2d38df6f54e80f06e587f339e6bb66a9'
            'SKIP')
validpgpkeys=('C91368749D79DFF18E3A492137D5937255358F32') # David Korth

prepare() {
  # reset build folder
  rm -rf build
  mkdir build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release \
    -DINSTALL_DEBUG=0
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
