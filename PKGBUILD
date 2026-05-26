# Contributor: Patrick Mischke
pkgname='python-ibmcloudant'
_name='ibmcloudant'
pkgver=0.11.7
pkgrel=1
pkgdesc="Python Library for Cloudant and CouchDB Access. Successor of python-cloudant"
url="https://github.com/IBM/cloudant-python-sdk"
depends=('python-ibm-cloud-sdk-core' 'python-requests' 'python-dateutil' 'python-pyjwt' 'python' 'python-build')
makedepends=('python-setuptools' 'python-flit' 'python-installer')
license=('Apache-2.0')
arch=('any')
source=("https://github.com/IBM/cloudant-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e92c8542d5e96c55403e8390f387c0320f4fd88c200027983da163756c061b3')

build() {
  cd "cloudant-python-sdk-$pkgver"
  sed -i 's/flit_core >=3\.9,<4/flit_core >=3.9,<5/' pyproject.toml
  python -m build --wheel --no-isolation
}

package() {
  cd "cloudant-python-sdk-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl 
}
