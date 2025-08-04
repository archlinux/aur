# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=zinnia-python
pkgver=0.07
pkgrel=1
pkgdesc="Simple, customizable and portable online hand recognition system based on Support Vector Machines, Python bindings"
arch=('i686' 'x86_64')
url="https://github.com/silverhikari/zinnia/"
license=('BSD')
depends=('python' 'zinnia>=0.06')
makedepends=('python' 'swig')
options=(!emptydirs)
source=("https://github.com/silverhikari/zinnia/archive/$pkgver/zinnia-$pkgver.tar.gz")
sha256sums=('0200c6f91ad2825e0f15ba73fd40aefa1ce9d45e77acf30831424bc01331a106')

build() {
  cd "$srcdir/zinnia-$pkgver/swig"
  make python
  python setup.py build
}

package() {
  cd "$srcdir/zinnia-$pkgver/python"
  python setup.py install --prefix=$pkgdir/usr --optimize=1
  install -D -m644 $srcdir/zinnia-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
