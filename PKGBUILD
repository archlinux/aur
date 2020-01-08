# Maintainer: peippo <christoph.fink@gmail.com>

pkgbase=python-webhoseio
pkgname=('python-webhoseio' 'python2-webhoseio')
pkgver=0.5
pkgrel=0

pkgdesc="Simple client library for the webhose.io REST API"
url="https://github.com/Webhose/webhoseio-python/"
license=('MIT')

arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a5ec55b84e46dc02b4f332bbdef84e80c0585042ea22bc8eb5ae6f803773aefe')

prepare() {
   rm -rf ${_name}-$pkgver/*.egg-info
   cp -a ${_name}-$pkgver{,-py2}
}

build() {
   cd "$srcdir"/${_name}-$pkgver
   python setup.py build
 
   cd "$srcdir"/${_name}-$pkgver-py2
   python2 setup.py build
}

check() {
   cd "$srcdir"/${_name}-$pkgver
   python setup.py test

   cd "$srcdir"/${_name}-$pkgver-py2
   python2 setup.py test
}
 
package_python-webhoseio() {
   depends=('python' 'python-requests')
 
   cd ${_name}-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
 
package_python2-webhoseio() {
   depends=('python2' 'python2-requests')
 
   cd ${_name}-$pkgver-py2
   python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
