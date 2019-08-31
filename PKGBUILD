# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-multiaddr
_name=multiaddr
pkgver=0.0.8
pkgrel=1
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
    flake8 --ignore E501,E226 multiaddr tests
    python setup.py test
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('2faec68b479945fe6b48dd2dc1f8bcccf939aa148836e3a1ab806d6c75db1238')
