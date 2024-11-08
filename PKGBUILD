# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=firebase-admin-python
pkgname=python-firebase-admin
pkgver=6.6.0
pkgrel=1
pkgdesc="The Firebase Admin Python SDK enables server-side (backend) Python developers to integrate Firebase into their services and applications."
arch=('any')
url="https://github.com/firebase/firebase-admin-python"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-cachecontrol' 'python-google-api-core' 'python-google-api-python-client' 'python-google-cloud-firestore' 'python-google-cloud-storage' 'python-pyjwt')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('eb0a283d80ad112ff5cb036bbcd3e3650dcd8cbd9a1fba205b421b971a8e8bbb82a6385336fa21b9bb76e08f54db56d60e9d2b3f0f5927a537863d91f5c0ff21')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
