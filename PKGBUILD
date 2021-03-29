# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-sasl'
_pkgname=sasl
pkgver=0.2.1
pkgrel=1
pkgdesc='Python wrapper for Cyrus SASL' 
arch=('x86_64')
url='https://github.com/cloudera/python-sasl'
license=('Apache')
makedepends=('cython' 'python-setuptools')
depends=('gcc-libs' 'libsasl')
checkdepends=()
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('04f22e17bbebe0cd42471757a48c2c07126773c38741b1dad8d9fe724c16289d')

prepare() {
    cd "$_pkgname-$pkgver"
    sed -i '1i#cython: language_level=3' sasl/saslwrapper.pyx
    sed 's/\.cpp/.pyx/' -i setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
