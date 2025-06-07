# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=firebase-admin-python
pkgname=python-firebase-admin
pkgver=6.9.0
pkgrel=1
pkgdesc="The Firebase Admin Python SDK enables server-side (backend) Python developers to integrate Firebase into their services and applications."
arch=('any')
url="https://github.com/firebase/firebase-admin-python"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-cachecontrol' 'python-google-api-core' 'python-google-api-python-client' 'python-google-cloud-firestore' 'python-google-cloud-storage' 'python-pyjwt')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('a9860c7e0dc37735dccdc0995f2e87385bc3370b3c6b7cada242ee7952b75cfaced8a2ad9c5ca32ca421f0b93260d29fe17d738f3ac7d327fc771f20ecf86aef')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
