# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-traitsui
pkgname=('python2-traitsui' 'python-traitsui')
pkgver=6.0.0
pkgrel=2
pkgdesc="Traits-capable user interfaces"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
makedepends=('python-setuptools' 'python-pyface' 'python2-setuptools' 'python2-pyface')

source=("traitsui-${pkgver}.tar.gz::https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")
md5sums=('4fd82bf5963f27860601064520f2d840')

prepare() {
  cd "$srcdir"
  cp -a traitsui-${pkgver} traitsui-py2-${pkgver}
}

build() {
  cd "$srcdir"/traitsui-py2-$pkgver

  msg "Building Python2"
  python2 setup.py build

  cd "$srcdir"/traitsui-$pkgver

  msg "Building Python3"
  python setup.py build
}

package_python2-traitsui() {
  depends=('python2-pyface')
  cd "$srcdir"/traitsui-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-traitsui() {
  depends=('python-pyface')
  cd "$srcdir"/traitsui-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

