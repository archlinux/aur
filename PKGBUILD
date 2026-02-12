# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pinecone-python-client
_base=pinecone
pkgname=python-${_base}
pkgver=8.0.1
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=('any')
url="https://github.com/pinecone-io/pinecone-python-client"
license=('Apache-2.0')
depends=('python' 'python-urllib3' 'python-certifi' 'python-grpcio' 'python-protobuf' 'python-dateutil' 'python-aiohttp' 'python-googleapis-common-protos' 'python-tqdm' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('2b8831fca4be9b8ef86329400e339109e8c211d8c4433b82764d782b4741e3db1cbacbd4e136b8edea5b3c5173b5942144d82b242b325a03c4d2200b0895f9b5')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
