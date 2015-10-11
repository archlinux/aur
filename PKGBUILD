pkgbase=python-cgroupspy
pkgname=(python-cgroupspy python2-cgroupspy)
_pypiname=cgroupspy
pkgver=0.1.2
pkgrel=1
pkgdesc="Python library for managing cgroups."
arch=('any')
url="https://pypi.python.org/pypi/$_pypiname"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=()
optdepends=()
source=("https://pypi.python.org/packages/source/c/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('57b6a0ef2fb9f88a3c8ee65779fcd08f47f661405f21d7e5846b0a30554bd31e520c2dc7896b832c198e601505d1dcb33c6c82e8647c315d6fa45be8a47aa0ba')

prepare() {
  cp -r $_pypiname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py build

  cd "$srcdir/$_pypiname-$pkgver-py2"
  python2 setup.py build
}

package_python-cgroupspy() {
  depends=('python')

  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cgroupspy() {
  depends=('python2')

  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
