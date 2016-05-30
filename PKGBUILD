# Maintainer: Joakim Hernberg <jhernberg at alchemy dot lu>

pkgname=rt-tests
pkgver=1.0
pkgrel=1

pkgdesc="A collection of latency testing tools for the linux(-rt) kernel"
url="http://rt.wiki.kernel.org/"
arch=('i686' 'x86_64')
license=('GPL2')

depends=('python2' 'numactl')
source=("https://www.kernel.org/pub/linux/utils/rt-tests/$pkgname-$pkgver.tar.gz")
sha256sums=('bb6c34423dbbe2a003f219c30c0700fe0d5793bcb939c95f10066fce0bf5fe7f')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i s/'shell python'/'shell python2'/g Makefile
  sed -i s/'mpath = os.path.join(path, m) + ".ko"'/'mpath = os.path.join(path, m) + ".ko.gz"'/g src/hwlatdetect/hwlatdetect.py
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}
