# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=firebase-admin-python
pkgname=python-firebase-admin
pkgver=6.3.0
pkgrel=1
pkgdesc="The Firebase Admin Python SDK enables server-side (backend) Python developers to integrate Firebase into their services and applications."
arch=('any')
url="https://github.com/firebase/firebase-admin-python"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-cachecontrol' 'python-google-api-core' 'python-google-api-python-client' 'python-google-cloud-firestore' 'python-google-cloud-storage' 'python-pyjwt')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('612751d00cebcadb2ae94806fcddfd925fce1d64a6434eebc2752248e6938c3d47a315a03ddd34fcfa21d00460facf6750d664805c55db6cdfb6d3d1ea333083')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
