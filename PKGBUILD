# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=marimo
pkgname=marimo
pkgver=0.13.4
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://marimo.io/'
license=('Apache-2.0')
options=(!debug)

depends=(
    'python-click>=8.0' 'python-click<9'
    'python-jedi>=0.18.0'
    'python-markdown>=3.4' 'python-markdown<4'
    'python-pymdown-extensions>=10.11.2' 'python-pymdown-extensions<11'
    'python-pygments>=2.13' 'python-pygments<3'
    'python-tomlkit>=0.12.0'
    'python-yaml>=6.0'
    'uvicorn>=0.22.0'
    'python-starlette>=0.26.1'
    'python-websockets>=10.0.0'
    'python-pycrdt>=0.11.0'
    'python-docutils>=0.16.0'
    'python-psutil>=5.0'
    'python-itsdangerous>=2.0.0'
    'python-narwhals>=1.12.0'
    'ruff'
    'python-packaging'
)

optdepends=(
    'jupyter-nbformat: Export as IPYNB'
    'python-altair: Plotting in datasource viewer'
    'python-duckdb: SQL cells support'
    'python-openai: AI features'
    'python-polars: SQL output back in Python'
    'python-sqlglot: SQL cells parsing'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatch'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('2e6d56b180a83277bbfcbefcb61ae800749f7bae059e52c389c4d38bd949400e')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
}