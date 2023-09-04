# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-ipfshttpclient
_name=ipfshttpclient
pkgver=0.7.0
pkgrel=4
pkgdesc="Python IPFS HTTP client library"
arch=('any')
conflicts=("python-ipfsapi") # legacy name
url="https://pypi.python.org/pypi/ipfshttpclient"
license=('MIT')
depends=('python'
         'python-httpcore'
         'python-httpx'
         'python-multiaddr'
         'python-netaddr'
         'python-requests'
         'python-setuptools'
         'python-six'
        )
checkdepends=('kubo>=0.4.23'
	      'python-pytest' 'python-pytest-cov' 'python-pytest-ordering'
	      'python-pytest-dependency'
	      'python-mock' 'python-pytest-mock'
	      'python-cid' 'python-pytest-cid'
	      'python-pytest-localserver' 'python-pluggy' 'python-py'
	     )
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
