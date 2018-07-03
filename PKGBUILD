# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pysimplesoap
pkgname=(python-pysimplesoap python2-pysimplesoap)
pkgver=1.16.2
_commit=a5c1f885e4af24ed3079bdf7f338523826d3404a
pkgrel=2
pkgdesc="Python simple and lightweight SOAP Library"
url="https://github.com/pysimplesoap/pysimplesoap"
license=('LGPL')
arch=('any')
makedepends=('python' 'python2' 'pandoc')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$_commit.tar.gz::https://github.com/pysimplesoap/pysimplesoap/archive/$_commit.tar.gz")
sha512sums=('bd0d1cf9427c4a834051cdb0358d22884d966c0f8ce024e6f5bd61468a2e1fd7d74bc831305a9aafe03df40e5d541447e93beb84939019b129b39f6dbba9aa55')

prepare() {
  mv pysimplesoap-{$_commit,$pkgver}
  cp -a pysimplesoap-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pysimplesoap-$pkgver
  python setup.py build

  cd "$srcdir"/pysimplesoap-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/pysimplesoap-$pkgver
  nosetests3 -a !internal,!disabled || warning "Tests failed"

  cd "$srcdir"/pysimplesoap-$pkgver-py2
  nosetests2 -a !internal,!disabled || warning "Tests failed"
}

package_python-pysimplesoap() {
  depends=('python')

  cd pysimplesoap-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pysimplesoap() {
  depends=('python2')

  cd pysimplesoap-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
