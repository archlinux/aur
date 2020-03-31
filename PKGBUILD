# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=(python-rchitect python2-rchitect)
_pkgname=${pkgname#python-}
pkgver=0.3.19
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools'
             'python-six>=1.9.0' 'python2-six>=1.9.0')
checkdepends=('python2-pytest' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbea6df9bb071bac184ae78d897650794689c441f65d1b5313b14484c1f2d34c')

check_disabled() { # unnamed error
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
  python2 setup.py test
}

package_python-rchitect() {
  depends=('r>3.4.0' 'python-multipledispatch' 'python-cffi')
  replaces=('python-rapi')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-rchitect() {
  depends=('r>3.4.0' 'python2-multipledispatch' 'python2-cffi')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
