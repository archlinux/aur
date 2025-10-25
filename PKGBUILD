# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=marimo
pkgname=marimo
pkgver=0.17.2
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://marimo.io/'
license=('Apache-2.0')
options=(!debug)

depends=(
    'python-click>=8.0' 'python-click<9'
    'python-jedi>=0.18.0'
    'python-markdown>=3.6' 'python-markdown<4'
    'python-pymdown-extensions>=10.15' 'python-pymdown-extensions<11'
    'python-pygments>=2.19' 'python-pygments<3'
    'python-tomlkit>=0.12.0'
    'python-yaml>=6.0'
    'uvicorn>=0.22.0'
    'python-starlette>=0.35.0'
    'python-websockets>=14.2.0'
    'python-loro>=1.5.0'
    'python-docutils>=0.16.0'
    'python-psutil>=5.0'
    'python-itsdangerous>=2.0.0'
    'python-narwhals>=2.0.0'
    'python-packaging'
    'python-msgspec>=0.19.0' # Using original version instead of marimo's
)

optdepends=(
    'jupyter-nbformat: Export as IPYNB'
    'python-altair: Plotting in datasource viewer'
    'python-duckdb: SQL cells support'
    'python-openai: AI features'
    'python-polars: SQL output back in Python'
    'python-sqlglot: SQL cells parsing'
    'ruff: Formatting'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'

    'python-uv-build'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c95a357d688d2cd1d0235f97ea597b009e64c708fdd4760396cc9e62ca5de544')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
}