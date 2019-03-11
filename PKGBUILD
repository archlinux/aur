# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-partd
_pkgname=partd
pkgver=0.3.9
pkgrel=1
pkgdesc="Appendable key-value storage"
arch=('any')
url="http://github.com/dask/partd/"
license=('BSD')
depends=('python' 'python-locket' 'python-toolz')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-pyzmq' 'python-numpy' 'python-pandas' 'python-blosc')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  "pandas-datetime.patch")
sha256sums=('1fd6d9c12f14ea180e659a9e4a686ff2816dd930e8fb0b84c0d8116a29cfe66b'
            '81ee6e96a5d7c5e5d19e12d8ab62944d891c683869fa5c2d6e4112c312b3592d')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../pandas-datetime.patch
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  export PYTHONPATH=build/lib
  py.test
}

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
