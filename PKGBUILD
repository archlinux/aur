# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=skribilo
pkgver=0.9.5
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
sha256sums=('00826a21c4634fb0b410ee89eb48068c445d800825874654e3d53d5ca3f0bf09')
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
  find $srcdir/ -name "*.png" -exec install -m644 {} "$pkgdir"/usr/share/doc/$pkgname \;
}
