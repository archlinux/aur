# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=gw
pkgver=1.1.4
pkgrel=1
pkgdesc="Genome browser and variant annotation"
arch=('x86_64')
url="https://github.com/kcleal/gw"
license=('MIT')
depends=('gcc-libs' 'freetype2' 'fontconfig' 'glfw' 'htslib')
makedepends=('make')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ceb439bdd699810d2b2b0e265c10956045a758de4e96c3a47149f83fc451b1cd')

prepare(){
  cd $srcdir/$pkgname-$pkgver
  make prep
}

build(){
  cd $srcdir/$pkgname-$pkgver
  LDLIBS+="-lcrypto -lssl" make
}

package(){
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 ".gw.ini" $pkgdir/usr/bin/".gw.ini"
  
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cd docs
  rm -rf install
  mv *  $pkgdir/usr/share/doc/$pkgname

}
