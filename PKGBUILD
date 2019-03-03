# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-ipfsapi
_name=ipfsapi
pkgver=0.4.3
pkgrel=1
pkgdesc="Python IPFS API client library"
arch=('any')
url="https://pypi.python.org/pypi/ipfsapi"
license=('MIT')
depends=('python'
         'python-requests'
         'python-setuptools'
        )
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-ordering' 'python-pytest-mock'
	      'python-pluggy' 'python-py' 'python-httmock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f2e7cc0c3f1f3b96730638072ab41ca76e1860a8b91fc5f815f66af886019f8e')

check() {
  cd "$srcdir/$_name-$pkgver"

  # Exclude tests that take a long time to run or that fail
  ./test/run-tests.py -k 'not (test_block_get or test_block_stat or test_bitswap_unwant)'
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
