pkgname=python-model-hosting-container-standards
pkgver=0.1.13
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
source=("${pkgname}::git+https://github.com/aws/model-hosting-container-standards.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}/python"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
