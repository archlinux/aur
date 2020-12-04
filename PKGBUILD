# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webhoseio
pkgver=0.5
pkgrel=2

pkgdesc="Simple client library for the webhose.io REST API"
url="https://github.com/Webhose/webhoseio-python/"
license=('MIT')

arch=('any')
makedepends=('python-setuptools')
depends=(
    'python'
    'python-requests'
)

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a5ec55b84e46dc02b4f332bbdef84e80c0585042ea22bc8eb5ae6f803773aefe')

prepare() {
   rm -rf ${_name}-$pkgver/*.egg-info
}

build() {
   cd "$srcdir"/${_name}-$pkgver
   python setup.py build
}

check() {
   cd "$srcdir"/${_name}-$pkgver
   python setup.py test
}
 
package() {
   cd ${_name}-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
