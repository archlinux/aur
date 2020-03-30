# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=(python-pymilter python2-pymilter)
_pkgname=pymilter
pkgver=1.0.4
pkgrel=2
pkgdesc="Python bindings for libmilter API"
arch=('x86_64')
url="https://github.com/sdgathman/pymilter"
license=('GPL')
makedepends=('libmilter' 'python-setuptools' 'python2-setuptools')
source=("${url}/archive/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f871e29d2bb4bb192e9d9a1f205278f55cb0092a6c8c84ab698171924e4d2a2c')

prepare() {
  # Fix bad extract naming
  mv "${_pkgname}-${_pkgname}-${pkgver}" "${pkgname}-${pkgver}"  

  # Split for Python and Python2
  cp -a "$pkgname-$pkgver"{,-py2}
}

build() {
  cd "$srcdir/python-$_pkgname-$pkgver" 
  python setup.py build

  cd "$srcdir/python-$_pkgname-$pkgver-py2"
  python2 setup.py build
}

package_python-pymilter() {
  depends=('python')
  cd "$srcdir/python-$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build 
}

package_python2-pymilter() {
  pkgdesc="Python 2 bindings for libmilter API"
  depends=('python2')
  replaces=('pymilter')
  cd "$srcdir/python-$_pkgname-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
