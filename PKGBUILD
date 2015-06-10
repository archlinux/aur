# Maintainer: Joakim Hernberg <jhernberg at alchemy dot lu>

pkgname=rt-tests
pkgver=0.92
pkgrel=1

pkgdesc="A collection of latency testing tools for the linux(-rt) kernel"
url="http://rt.wiki.kernel.org/"
arch=('i686' 'x86_64')
license=('GPL2')

depends=('python2' 'numactl')

source=("ftp://ftp.kernel.org/pub/linux/kernel/people/clrkwllms/$pkgname-$pkgver.tar.gz")
sha256sums=('02f393024876e2f225277c2e43f296d0b5954c8168716d97407dca9b24159b98')

prepare() {
  cd "$pkgname"
  sed -i s/'shell python'/'shell python2'/g Makefile
  sed -i '1 s/python$/&2/' src/hwlatdetect/hwlatdetect.py
  sed -i s/'mpath = os.path.join(path, m) + ".ko"'/'mpath = os.path.join(path, m) + ".ko.gz"'/g src/hwlatdetect/hwlatdetect.py
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}
