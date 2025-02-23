_name=marimo
pkgname=marimo
pkgver=0.11.8
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://marimo.io/'
license=('Apache-2.0')
options=(!debug)

depends=(
    'python-click'
    'python-jedi'
    'python-markdown'
    'python-pymdown-extensions'
    'python-pygments'
    'python-tomlkit'
    'python-yaml'
    'uvicorn'
    'python-starlette'
    'python-websockets'
    'python-pycrdt'
    'python-docutils'
    'python-psutil'
    'python-itsdangerous'
    'python-narwhals'
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
    'python-typing_extensions: python <=3.10 support'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatch'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('fd0863fa896af522a4b3b8241c64651cbae79573bcadb01952897011a2d459ef')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}