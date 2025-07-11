# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=fasta2a
pkgname=python-${_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="Convert an AI Agent into a A2A server! ✨"
arch=('any')
url="https://github.com/pydantic/fasta2a"
license=('MIT')
depends=('python' 'python-starlette' 'python-pydantic' 'python-opentelemetry-api')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-asgi-lifespan' 'python-httpx' 'python-inline-snapshot' 'python-pytest')
optdepends=('python-logfire: logfire')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0bca45f675fb3354ae6cd0e6dd0be1d504ee135b8e802b4058fb3485521f61e9')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
