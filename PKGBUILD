# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=marimo
pkgname=marimo
pkgver=0.19.8
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://github.com/marimo-team/marimo'
license=('Apache-2.0')
options=(!debug)

depends=(
    'python'
    'python-click>=8.0'
    'python-jedi>=0.18.0'
    'python-markdown>=3.6'
    'python-pymdown-extensions>=10.15'
    'python-pygments>=2.19'
    'python-tomlkit>=0.12.0'
    'python-yaml>=6.0.1'
    'uvicorn>=0.22.0'
    'python-starlette>=0.37.2'
    'python-websockets>=14.2.0'
    'python-docutils>=0.16.0'
    'python-psutil>=5.0'
    'python-itsdangerous>=2.0.0'
    'python-narwhals>=2.0.0'
    'python-packaging'
    'python-msgspec>=0.20.0'
)

optdepends=(
    # LSP
    'python-lsp-server: LSP server'
    'python-lsp-ruff: LSP server'

    # Sandbox (marimo edit --sandbox DIRECTORY)
    'python-pyzmq: IPC communication for sandbox kernels'
    'uv: Sandbox management'

    # SQL
    'python-duckdb: SQL cells support'
    'python-polars: SQL output back in Python'
    'python-sqlglot: SQL cells parsing'

    # Others
    'python-altair: Plotting in datasource viewer'
    'python-pydantic-ai-slim: AI features'
    'jupyter-nbformat: Export as IPYNB'
    'ruff: Formatting'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'

    'python-uv-build'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('2b5702e2708bfe37a72ca4b7c49fde256451a6a08cfbdbaa511d659ad1873814c8390c1139b656f1cd836093410a7489c9bbc492252f068c1c3d3eb9e548a45f')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
}