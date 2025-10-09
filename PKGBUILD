# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=firebase-admin-python
pkgname=python-firebase-admin
pkgver=7.1.0
pkgrel=2
pkgdesc="The Firebase Admin Python SDK enables server-side (backend) Python developers to integrate Firebase into their services and applications."
arch=('any')
url="https://github.com/firebase/firebase-admin-python"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-cachecontrol' 'python-google-api-core' 'python-google-cloud-firestore' 'python-google-cloud-storage' 'python-pyjwt')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('d77cc0027f38a2118babf3f96446e5ffacff91de24e8dc432a083aebd989a3df1a7e699ddb1b6ca64b98b8c5363d58e37193ad683d6139113df663432c5538a2')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
