# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mmg
pkgver=5.4.3
pkgrel=3
pkgdesc='Anisotropic tetrahedral remesher and moving mesh generator'
url="http://www.mmgtools.org/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake')
provides=('mmg3d')
conflicts=('mmg3d')
repalces=('mmg3d')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MmgTools/mmg/archive/v$pkgver.tar.gz"  https://github.com/MmgTools/mmg/commit/cbd4418093c549fd7205208f44df13fbfe155fbb.patch)
sha256sums=('73fb63616d87094a1fbd0a721ded7e062c7768844e450df4fa34e50dd9924c41'
            '7e5d4f7182fd9e768b8cab23af715e17c08af8634be5e70c32f28a2565547fb5')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/cbd4418093c549fd7205208f44df13fbfe155fbb.patch
}

build () {
  cd $pkgname-$pkgver

  cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DLIBMMG2D_SHARED=ON \
    -DLIBMMG3D_SHARED=ON \
    -DLIBMMGS_SHARED=ON \
    -DLIBMMG_SHARED=ON

  make
}

package() {
  cd $pkgname-$pkgver

  make install
}
