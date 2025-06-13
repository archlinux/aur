# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=gw
pkgver=1.2.3
pkgrel=1
pkgdesc="Genome browser and variant annotation"
arch=('x86_64')
url="https://github.com/kcleal/gw"
license=('MIT')
depends=('gcc-libs' 'freetype2' 'fontconfig' 'glfw' 'htslib')
makedepends=('make')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f70dce6dff1e17108fce10a5a4a2e5f511e5b5512249e1fa35c4d65cf7627c4')

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
