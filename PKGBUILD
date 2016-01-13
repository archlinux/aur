# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=skribilo
pkgver=0.9.3
pkgrel=1
pkgdesc="The Ultimate Document Programming Framework"
url="http://www.nongnu.org/skribilo/"
arch=('any')
license=('GPL')
depends=('bash')
makedepends=('guile-reader-git' 'ploticus')
optdepends=('texlive-core: for postscript or pdf output' 
	    'lout: for postscript or pdf output'
	    'ploticus: for pie-charts'
	    'guile-lib: to be able to use the RSS-2-reader')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e7623d5a7adbaf302bb7e63b7ab5101a')
options=('!makeflags')
install=skribilo.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/info/*.png
  install -d $pkgdir/usr/share/doc/$pkgname
  find $srcdir/ -name "*.png" -exec install -m644 {} $pkgdir/usr/share/doc/$pkgname \;
}
