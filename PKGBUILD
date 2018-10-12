# Maintainer: Jakob Dübel <jkbd@posteo.de>
pkgname=drc
pkgver=3.2.2
pkgrel=1
pkgdesc="Digital Room Correction"
arch=('x86_64' 'i686')
url="http://drc-fir.sourceforge.net/"
license=('GPL2')
depends=('gcc-libs')
optdepends=('octave: building graphs')

source=("https://sourceforge.net/projects/drc-fir/files/drc-fir/$pkgver/$pkgname-$pkgver.tar.gz"
	"drc.diff")
	
sha1sums=('293e8f074408832af0be08cb05e3940cb9489968'
	'9b8753984ba2f4af0a421add55d4f737a644c7eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "${srcdir}/drc.diff"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make
}

package() {
  install -dm644 "$pkgdir/usr/bin"

  cd "$srcdir/$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" install
}
