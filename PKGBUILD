# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pinecone-python-client
_base=pinecone
pkgname=python-${_base}
pkgver=7.2.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=('any')
url="https://github.com/pinecone-io/pinecone-python-client"
license=('Apache-2.0')
depends=('python' 'python-urllib3' 'python-certifi' 'python-grpcio' 'python-protobuf' 'python-dateutil' 'python-aiohttp' 'python-googleapis-common-protos' 'python-tqdm' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('c44d5c3e320576a7f2f8eb172e0029e7341f10d1975bf5507bb6254ad421655bf330dc2e377cf3f76e226b85593eff77eec791a0f73e609b0731d3ff5cb50842')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
