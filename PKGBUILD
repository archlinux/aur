# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

_pypiname=CurrencyConverter
pkgname=('python-currencyconverter' 'python2-currencyconverter')
pkgver=0.13.10
pkgrel=2
pkgdesc="A currency converter using the European Central Bank data."
arch=(any)
url="https://pypi.python.org/pypi/CurrencyConverter"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
conflicts=('python3-currencyconverter')
#source=("https://pypi.python.org/packages/source/w/CurrencyConverter/$_pypiname-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")

md5sums=('e44756a4cbbc7b0c35f33f956c47224f')

prepare() {
  cp -a ${_pypiname}-$pkgver{,-py2}
}

build() {
  cd "$srcdir/${_pypiname}-$pkgver"
  python setup.py build

  cd "$srcdir/${_pypiname}-$pkgver-py2"
  python2 setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir/${_pypiname}-$pkgver"
  python setup.py install --root="$PWD/tmp_install" --optimize=1
#  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.6/site-packages:$PYTHONPATH" py.test wheel

  cd "$srcdir/${_pypiname}-$pkgver-py2"
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1
 # PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH" py.test2 wheel
}

package_python-currencyconverter() {
  depends=('python')

  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-currencyconverter() {
  depends=('python2')

  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/currency_converter" "$pkgdir/usr/bin/currency_converter2"
}

# vim:set ts=2 sw=2 et:
