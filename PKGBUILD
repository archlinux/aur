# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname=pytest-csv
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=1.1.0
pkgrel=1
arch=(x86_64)
license=('GPL')
pkgdesc="CSV output for pytest."
url="https://github.com/nicoulaj/pytest-csv"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('f7eeb66d39d4ad510a80c75f1c48462c8d6e45fd6d8d03dde2b28e3d7fe3f67d1c13bc2aa9b97dec2bef29d2b009f2b131ce92718ec844186805b57f58ba949c')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  cd "$srcdir"/${_pkgname}-$pkgver
  python setup.py build_ext --static-extras

  cd "$srcdir"/${_pkgname}-$pkgver-py2
  python2 setup.py build_ext --static-extras
}

package_python-pytest-csv() {
  cd gr-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pytest-csv() {
  cd gr-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
