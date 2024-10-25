# Maintainer: Lukas Matt <lukas@matt.wf>
pkgname=libflowmanager
pkgver=3.0.0
pkgrel=2
pkgdesc="This library is designed to facilitate performing flow-based measurement tasks using packet-based inputs, particularly packet trace files"
arch=('x86_64')
url="https://github.com/LibtraceTeam/libflowmanager"
license=('LGPL')
depends=('libtrace')
source=(
  "0001-Define-missing-UINT32_MAX.patch"
  "https://github.com/LibtraceTeam/libflowmanager/archive/refs/tags/v3.0.0.tar.gz")
md5sums=(
  '89e6837ad16547a485a5d4db9bd8845a'
  '2fc094822fd6b953973fd70a296e1080')
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
