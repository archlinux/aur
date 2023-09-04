# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-multiaddr
_name=multiaddr
pkgver=0.0.9
pkgrel=2
pkgdesc="Python implementation of jbenet's multiaddr"
arch=('any')
url="https://pypi.python.org/pypi/multiaddr"
license=('MIT')
depends=('python'
         'python-base58'
         'python-netaddr'
         'python-setuptools'
         'python-six'
         'python-varint'
        )
checkdepends=('flake8' 'python-pytest' 'python-tox')
source=("https://pypi.io/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    flake8 --ignore E501,E226,E275,I001,I003,I004,I005,BLK100 multiaddr tests
    python setup.py test
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('30b2695189edc3d5b90f1c303abb8f02d963a3a4edf2e7178b975eb417ab0ecf')
