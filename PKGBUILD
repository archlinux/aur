# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint
pkgname=python-$_name
pkgver=3.0.0
pkgrel=1
pkgdesc="Library with base interfaces for LangGraph checkpoint savers."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint"
depends=('python' 'python-langchain-core' 'python-ormsgpack')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-dataclasses-json' 'python-numpy' 'python-pandas' 'python-redis')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f738695ad938878d8f4775d907d9629e9fcd345b1950196effb08f088c52369e')

build() {
    cd "${srcdir}"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
