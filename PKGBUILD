# Maintainer: Eugene Dvoretsky <radioxoma at gmail.com>

pkgname=('python2-prokaryote')
pkgver=1.0.11
pkgrel=1
pkgdesc="Python CellProfiler’s Java dependencies"
arch=('i686' 'x86_64')
url="https://github.com/CellProfiler/prokaryote"
license=('BSD')
depends=('jdk7-openjdk' 'python2-numpy')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/CellProfiler/prokaryote/archive/${pkgver}.tar.gz")
sha256sums=('c63ef0aa40513c707b5bc2defa971e00718097a474de2f52e8ca1347cafb82e4')

prepare() {
  cd "$srcdir/prokaryote-$pkgver"
}

build() {
  cd "$srcdir/prokaryote-$pkgver"
  # Warning! It will fetch more than 130 Mb.
  python2 setup.py build
}

package() {
  cd "$srcdir/prokaryote-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
