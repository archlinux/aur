# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=tegaki-recognize
pkgver=0.3.1.2
pkgrel=4
pkgdesc="Chinese and Japanese Handwriting Recognition program"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-pygtk>=0.2')
makedepends=('python2')
optdepends=('tegaki-models-wagomu-japanese' 'tegaki-models-zinnia-japanese' 'tegaki-models-wagomu-simplified-chinese' 'tegaki-models-zinnia-simplified-chinese' 'tegaki-models-zinnia-traditional-chinese' 'tegaki-train' 'tegaki-tools')
source=("https://github.com/tegaki/tegaki/releases/download/v0.3.1/$pkgname-$pkgver.tar.gz")
md5sums=('c9f09bccd6f621908c666d54cbe01805')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/\@PREFIX/\/usr/' tegaki-recognize.desktop.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"	
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=$pkgdir/usr --optimize=1
  sed -i -e "s|$pkgdir||" $pkgdir/usr/share/menu/tegaki-recognize
}
