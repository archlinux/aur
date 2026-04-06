# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=python-model-hosting-container-standards
_pkgname=model-hosting-container-standards
pkgver=0.1.14
pkgrel=1
pkgdesc="Python toolkit for standardized model hosting container implementations with Amazon SageMaker integration"
arch=('any')
url="https://github.com/aws/model-hosting-container-standards"
license=('Apache-2.0')
depends=(
  'python'
  'python-fastapi'
  'python-pydantic'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry-core'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aws/model-hosting-container-standards/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/python"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
