# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-${_name}
pkgver=1.2.1
pkgrel=1
pkgdesc='Python implementation of the Model Context Protocol (MCP).'
arch=('any')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('c9d43dbfe943aa1530e2be8f54b73af3ebfb071243827b4483d421684806cb45')
depends=('python>=3.10' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn')
makedepends=('python-hatchling')
checkdepends=('pyright' 'python-pytest' 'python-ruff' 'python-trio' 'python-pytest-flakefinder' 'python-pytest-xdist' 'python-uv' 'python-typer' 'python-dotenv')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests --flake-finder --timeout=360
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
