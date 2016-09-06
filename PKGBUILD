# Contributor: Jonathan Liu <net147@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: menta

pkgname=sam2p
pkgver=0.49.2
pkgrel=5
pkgdesc="A bitmap-to-eps-or-pdf-converter that produces very small files"
arch=('i686' 'x86_64')
url="http://www.inf.bme.hu/~pts"
license=('GPL2')
depends=('gcc-libs')
#makedepends=('imake')
optdepends=('ghostscript: PS, EPS, PDF support'
	    'libjpeg: JPEG support'
	    'tif22pnm: for tiff support'
	    'png22pnm: for png support')
# 'netpbm: PNG support'
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sam2p/$pkgname-$pkgver.tar.gz" makedep.patch)
sha256sums=('0e75d94bed380f8d8bd629f7797a0ca533b5d0b40eba2dab339146dedc1f79bf'
            '36f7d93a61fa13ff2ae2925ca8e009ee096e0d491d6ec58b5d254390647938eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/makedep.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CXX="g++ --std=c++98" ./configure --prefix="$pkgdir"/usr --enable-lzw --enable-gif
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install
  install -D -m644 README "$pkgdir"/usr/share/sam2p/docs/README
}
