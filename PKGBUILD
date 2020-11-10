# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=(python-rchitect python2-rchitect)
_pkgname=${pkgname#python-}
pkgver=0.3.29
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools'
             'python-six>=1.9.0' 'python2-six>=1.9.0')
checkdepends=('python2-pytest' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19f48ab221aee7d85b2b60c1e3dc3a589a440ef40977dbc8d34af1d7d2617b43')

check_disabled() { # unnamed error
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
  python2 setup.py test
}

package_python-rchitect() {
  depends=('r>3.4.0' 'python-multipledispatch' 'python-cffi>=1.10.0')
  replaces=('python-rapi')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-rchitect() {
  depends=('r>3.4.0' 'python2-multipledispatch' 'python2-cffi>=1.10.0')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
