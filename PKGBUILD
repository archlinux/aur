# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=skribilo
pkgver=0.10.0
pkgrel=1
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
sha256sums=('8cff48ee176cedfd5032649a349a46952bea50ec06720f829c1ccca29212f50e')
options=('!makeflags')

build() {
  cd $pkgname-$pkgver
  GUILE_EFFECTIVE_VERSION=3.0 ./configure --prefix=/usr
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/share/info/*.png
  install -d "$pkgdir"/usr/share/doc/$pkgname
  find "$srcdir" -name "*.png" -exec install -m644 {} "$pkgdir"/usr/share/doc/$pkgname \;
}
