# Contributor: Jonathan Liu <net147@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: menta

pkgname=sam2p
pkgver=0.49.4
pkgrel=1
pkgdesc="A bitmap-to-eps-or-pdf-converter that produces very small files"
arch=('i686' 'x86_64')
url="http://www.inf.bme.hu/~pts"
license=('GPL2')
depends=('gcc-libs')
makedepends=('tar')
optdepends=('ghostscript: PS, EPS, PDF support'
	    'libjpeg: JPEG support'
	    'tif22pnm: for tiff support'
	    'png22pnm: for png support')
# 'netpbm: PNG support'
source=("https://github.com/pts/sam2p/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz" makedep.patch)
sha256sums=('d23707b2405ca94e2a237cb81f62fb5916f5e4360cf9a705061479c8fa1dff5c'
            '73c18ac87fa8fc498ea14fb2ed162e50470fa40ce4f273bbc13dfaa2b13c8f7d')
noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  tar xf $pkgname-$pkgver.tar.gz
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/makedep.patch
}

build() {
  cd $pkgname-$pkgver
  CXX="g++ --std=c++98" ./configure --prefix="$pkgdir"/usr --enable-lzw --enable-gif
  PERL5LIB+=. make all
}

package() {
  cd $pkgname-$pkgver
  make install
  install -D -m644 README "$pkgdir"/usr/share/sam2p/docs/README
}
