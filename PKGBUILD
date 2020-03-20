# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=skribilo
pkgver=0.9.4
pkgrel=3
pkgdesc="The Ultimate Document Programming Framework"
url="http://www.nongnu.org/skribilo/"
arch=('x86_64')
license=('GPL')
depends=('bash')
makedepends=('guile' 'guile-reader' 'ploticus')
optdepends=('texlive-core: for postscript or pdf output' 
	    'lout: for postscript or pdf output'
	    'ploticus: for pie-charts'
	    'guile-lib: to be able to use the RSS-2-reader')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ced67fe89f5a0b83273195a5501e40c318f1becfbaacafdbcf5d27e5a4b3dc1b')
options=('!makeflags')

build() {
  cd $pkgname-$pkgver
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/share/info/*.png
  install -d "$pkgdir"/usr/share/doc/$pkgname
  find $srcdir/ -name "*.png" -exec install -m644 {} "$pkgdir"/usr/share/doc/$pkgname \;
}
