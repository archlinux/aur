# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
pkgdesc='Libre reimplementation of the Steins;Gate visual novel'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpengine=$pkgver")
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname-new/archive/v$pkgver.tar.gz")
sha256sums=('eb6eac88c50fbf25e3acf80b69b558e227087b70ec8b89e50641dfa5b33d663f')

build() {
  cd $pkgname-new-$pkgver

  # linking order needs to be fixed
  export LDFLAGS=${LDFLAGS/--as-needed/--no-as-needed}

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-new-$pkgver DESTDIR="$pkgdir/" install
}
