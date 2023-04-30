# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Xiao-Long Chen <chenxiaolong at cxl.epac.to>

pkgname=charls
pkgver=2.4.0
pkgrel=1
pkgdesc='A C++ JPEG-LS library implementation'
arch=('i686' 'x86_64')
url='https://github.com/team-charls/charls'
license=('BSD')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('721f4fd6a8dc3ec6a334d1c3c15d1cb9faa149afddd0eff703466c20e775c294')

build() {
  mkdir -p build
  cd build
  cmake $srcdir/$pkgname-$pkgver -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
