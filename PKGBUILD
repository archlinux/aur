# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-traits
pkgname=('python2-traits' 'python-traits')
pkgver=4.6.0
pkgrel=3
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
makedepends=('python-setuptools' 'python-numpy' 'python2-setuptools' 'python2-numpy')

source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
md5sums=('32516d033347e983c12d8fa482642636')

prepare() {
  cd "$srcdir"
  cp -a traits-${pkgver} traits-py2-${pkgver}
}

build() {
  cd "$srcdir"/traits-py2-$pkgver

  msg "Building Python2"
  python2 setup.py build

  cd "$srcdir"/traits-$pkgver

  msg "Building Python3"
  python setup.py build
}

package_python2-traits() {
  depends=('python2-numpy')
  cd "$srcdir"/traits-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-traits() {
  depends=('python-numpy')
  cd "$srcdir"/traits-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

