# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pinecone-python-client
_base=pinecone
pkgname=python-${_base}
pkgver=8.1.2
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=('any')
url="https://github.com/pinecone-io/pinecone-python-client"
license=('Apache-2.0')
depends=('python' 'python-urllib3' 'python-certifi' 'python-grpcio' 'python-protobuf' 'python-dateutil' 'python-aiohttp' 'python-googleapis-common-protos' 'python-tqdm' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/v${pkgver}.tar.gz)
b2sums=('620e4fd1d32e905b847701be16f3cdb9f38f1499796ec33874d2874e1e9908a03398ad36d6fd5841fbe5bf5280ca0b930a5e37a450ec5dddad7d156de6cdbfe5')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
