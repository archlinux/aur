# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-ipfshttpclient
_name=ipfshttpclient
pkgver=0.7.0
pkgrel=1
pkgdesc="Python IPFS HTTP client library"
arch=('any')
conflicts=("python-ipfsapi") # legacy name
url="https://pypi.python.org/pypi/ipfshttpclient"
license=('MIT')
depends=('python'
         'python-multiaddr'
         'python-netaddr'
         'python-requests'
         'python-setuptools'
         'python-six'
        )
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-ordering' 'python-pytest-mock'
	      'python-pytest-localserver' 'python-pluggy' 'python-py'
	      #python-py-cid # appears to be optional
	     )
optdepends=('go-ipfs: IPFS daemon') # an IPFS deamon is a checkdepend, but not required to be go-ipfs
source=("https://pypi.io/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"

    # To exclude tests pass: -k 'not test_name'
    ./test/run-tests.py
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('feb1033c14c3ac87ee81264176c5beefeaf386385804427160466117ccc43693')
