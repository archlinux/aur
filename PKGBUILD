# Maintainer: Eugene Dvoretsky <radioxoma at gmail.com>

pkgname=('python2-javabridge')
pkgver=1.0.14
pkgrel=1
pkgdesc="Python wrapper for the Java Native Interface."
arch=('i686' 'x86_64')
url="https://github.com/CellProfiler/python-javabridge"
license=('BSD')
depends=('jdk7-openjdk' 'python2-numpy')
makedepends=('cython2')
source=("https://github.com/CellProfiler/python-javabridge/archive/${pkgver}.tar.gz")
sha256sums=('6784bcdc841da66e3dbf2f0fe87472bb4299e47d89b3e033c8dd41c6751fa4fd')

prepare() {
  cd "$srcdir/python-javabridge-$pkgver"
}

build() {
  cd "$srcdir/python-javabridge-$pkgver"
  # It can't figure out own version without git repo in folder
  # If version wasn't discovered, default value 0.0.0 breaks Cellprofiler
  echo "__version__ = \"$pkgver\"" > javabridge/_version.py
  python2 setup.py build
}

package() {
  cd "$srcdir/python-javabridge-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
