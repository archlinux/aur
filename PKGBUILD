# Contributor: Jonathan Liu <net147@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: menta

pkgname=sam2p
pkgver=0.49.2
pkgrel=2
pkgdesc="A bitmap-to-eps-or-pdf-converter that produces very small files"
arch=('i686' 'x86_64')
url="http://www.inf.bme.hu/~pts"
license=('GPL2')
depends=('gcc-libs')
makedepends=('makedepend')
optdepends=('ghostscript: PS, EPS, PDF support'
'libjpeg: JPEG support'
'tif22pnm: for tiff and png support')
# 'netpbm: PNG support'
source=("http://sam2p.googlecode.com/files/$pkgname-$pkgver.tar.gz" makedep.patch)
md5sums=('fd46bcd21576cf9441fc80639a6033b0'
         '3c7754d87b6e1b43b6a37db3944c2c91')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/makedep.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="$pkgdir"/usr --enable-lzw --enable-gif
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install
  install -D -m644 README "$pkgdir"/usr/share/sam2p/docs/README
}
