# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pinecone-python-client
_base=pinecone
pkgname=python-${_base}
pkgver=7.0.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=('any')
url="https://github.com/pinecone-io/pinecone-python-client"
license=('Apache-2.0')
depends=('python' 'python-urllib3' 'python-certifi' 'python-grpcio' 'python-protobuf' 'python-dateutil' 'python-aiohttp' 'python-googleapis-common-protos' 'python-tqdm' 'python-pandas')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('34a5ecfdd4f5ad6867f395cd278e9dc06a4dab8c3e5225ddd5b10861b8bbebab98732b0d85d325f4048d4478adcf2b57a560eb178a13e3908a7ac3674d887a34')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
