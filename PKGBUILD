pkgname=python-pure-protobuf
_gitname=protobuf
pkgver=3.0.1
pkgrel=1
pkgdesc='Python implementation of Protocol Buffers data types with dataclasses support.'
arch=('any')
url="https://github.com/eigenein/protobuf"
license=('MIT')
depends=('python')
makedepends=(
  git
  python-poetry-dynamic-versioning
)

source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d710a242e6e9cadc86dcaae2f28174477f76053bda501c077868fdd09597568eb52dbce02e4b463ef8cb3c9e2401d6754e333bec55614cfca1c7dc1cd7c211dd')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  POETRY_CACHE_DIR="${srcdir}/poetry-cache" POETRY_DYNAMIC_VERSIONING_BYPASS="${pkgver}" poetry build
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
