# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=firebase-admin-python
pkgname=python-firebase-admin
pkgver=6.5.0
pkgrel=1
pkgdesc="The Firebase Admin Python SDK enables server-side (backend) Python developers to integrate Firebase into their services and applications."
arch=('any')
url="https://github.com/firebase/firebase-admin-python"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-cachecontrol' 'python-google-api-core' 'python-google-api-python-client' 'python-google-cloud-firestore' 'python-google-cloud-storage' 'python-pyjwt')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('9d28e2a4ad99ef82e68c7c8cf2344aaaa2e964f9403393e944c6da1282b1a71e4b2915245b92f14816d90234e42a724f8dee03ebac3974cab95ef1454a7d3929')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
