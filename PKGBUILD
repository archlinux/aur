# Contributor: Jonathan Liu <net147@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: menta

pkgname=sam2p
pkgver=0.49.4
pkgrel=4
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
md5sums=('78015830657f245839d0bcecb3340a6f'
         '0cd1b3cc7b2781b3df19769342af102b')
noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  tar xf $pkgname-$pkgver.tar.gz
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/makedep.patch
}

package() {
  cd $pkgname-$pkgver
  autoconf
  CXX="g++ --std=c++98" ./configure --prefix=/usr --enable-lzw --enable-gif
  PERL5LIB+=. make all
  install -Dm755 sam2p $pkgdir/usr/bin/sam2p
  install -Dm644 README "$pkgdir"/usr/share/sam2p/docs/README
}
