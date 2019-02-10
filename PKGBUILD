# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-traits
pkgname=('python2-traits' 'python-traits')
pkgver=5.0.0
pkgrel=1
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
makedepends=('python-setuptools' 'python-numpy' 'python2-setuptools' 'python2-numpy')

source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/release/${pkgver}.tar.gz")
sha1sums=('22571e71a65d0c521ce9267e10c0ac0a1fc63999')

prepare() {
  cd "$srcdir"
  cp -a traits-release-${pkgver} traits-release-py2-${pkgver}
}

build() {
  cd "$srcdir"/traits-release-py2-$pkgver

  # "Building Python2"
  python2 setup.py build

  cd "$srcdir"/traits-release-$pkgver

  # "Building Python3"
  python setup.py build
}

package_python2-traits() {
  depends=('python2-numpy')
  cd "$srcdir"/traits-release-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-traits() {
  depends=('python-numpy')
  cd "$srcdir"/traits-release-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

