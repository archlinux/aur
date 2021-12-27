# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=(python-pymilter python2-pymilter)
_pkgname=pymilter
pkgver=1.0.5
pkgrel=1
pkgdesc="Python bindings for libmilter API"
arch=('x86_64')
url="https://github.com/sdgathman/${_pkgname}"
license=('GPL')
makedepends=('libmilter'
			 'python-setuptools' 
			 'python2-setuptools')
source=("${url}/archive/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8093032829ddd53261dbe2991959514156767f3785dfb095ed9b17f3fba965e1')

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
