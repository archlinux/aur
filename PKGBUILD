# Maintainer: Lukas Matt <lukas@matt.wf>
pkgname=libflowmanager
pkgver=3.0.0
pkgrel=1
pkgdesc="This library is designed to facilitate performing flow-based measurement tasks using packet-based inputs, particularly packet trace files"
arch=('x86_64')
url="https://research.wand.net.nz/software/libflowmanager.php"
license=('LGPL')
depends=('libtrace')
source=(
  "0001-Define-missing-UINT32_MAX.patch"
  "https://research.wand.net.nz/software/libflowmanager/libflowmanager-3.0.0.tar.gz")
md5sums=(
  '89e6837ad16547a485a5d4db9bd8845a'
  'edd8be7a8a4ff678e9c0c3b5bb5946f0')
validpgpkeys=('1E9E2C1BCF7639B219FBE159903A00FC06CC137B')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/0001-Define-missing-UINT32_MAX.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
