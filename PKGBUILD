# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase='python-jsonpath-ng'
_libname=${pkgbase/python-/}
pkgname=('python-jsonpath-ng' 'python2-jsonpath-ng')
pkgver=1.4.3
pkgrel=1
pkgdesc="JSONPath implementation that aims to be standard compliant"
arch=(any)
url="https://github.com/tomas-fp/jsonpath-ng/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")
sha256sums=('b1fc75b877e9b2f46845a455fbdcfb0f0d9c727c45c19a745d02db620a9ef0be')

prepare() {
  cp -r $_libname-$pkgver $_libname-$pkgver-py2

  cd $_libname-$pkgver-py2
  sed '1 s/python$/python2/' -i jsonpath_ng/bin/jsonpath.py
  sed 's/jsonpath.py=/jsonpath.py2=/' -i setup.py
}

build() {
  cd "$srcdir"/$_libname-$pkgver
  python setup.py build

	cd "$srcdir"/$_libname-$pkgver-py2
	python2 setup.py build
}

package_python-jsonpath-ng() {
  depends=('python')

  cd "$srcdir"/$_libname-$pkgver
  python setup.py install -O1 --skip-build --root="$pkgdir"
}

package_python2-jsonpath-ng() {
  depends=('python2')

  cd "$srcdir"/$_libname-$pkgver-py2
  python2 setup.py install -O1 --skip-build --root="$pkgdir"
}
