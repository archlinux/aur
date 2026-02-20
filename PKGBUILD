# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pinecone-python-client
_base=pinecone
pkgname=python-${_base}
pkgver=8.1.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=('any')
url="https://github.com/pinecone-io/pinecone-python-client"
license=('Apache-2.0')
depends=('python' 'python-urllib3' 'python-certifi' 'python-grpcio' 'python-protobuf' 'python-dateutil' 'python-aiohttp' 'python-googleapis-common-protos' 'python-tqdm' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('c0b1cb0301ac90ab6a03576ec2c6eaac36f85d332f6a43ce04aeaa691c2ba506fb9aeb9e9a8b8e10086996f41a2308bb67202c79b038dc770d4e92b412a9cc20')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
