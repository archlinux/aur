# Maintainer: Eugene Dvoretsky <radioxoma at gmail.com>

pkgname=('python2-javabridge')
pkgver=1.0.11
pkgrel=1
pkgdesc="Python wrapper for the Java Native Interface."
arch=('i686' 'x86_64')
url="https://github.com/CellProfiler/python-javabridge"
license=('BSD')
depends=('jdk7-openjdk' 'python2-numpy')
makedepends=('cython2')
source=("https://github.com/CellProfiler/python-javabridge/archive/${pkgver}.tar.gz")
sha256sums=('9f0f92b451c758c9acd622b08a27173aa73a9271d93779def4da75925f78fbab')

prepare() {
  cd "$srcdir/python-javabridge-$pkgver"
  sed -i "s/cython/cython2/" setup.py  # Fragle patch
}

build() {
  cd "$srcdir/python-javabridge-$pkgver"
  python2 setup.py build
}

# check() {
#   cd "$srcdir/python-javabridge-$pkgver"
#   python2 setup.py test
# }

package() {
  cd "$srcdir/python-javabridge-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
