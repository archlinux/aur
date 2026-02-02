# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=marimo
pkgname=marimo
pkgver=0.19.7
pkgrel=2
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://github.com/marimo-team/marimo'
license=('Apache-2.0')
options=(!debug)

depends=(
    'python'
    'python-click>=8.0' 'python-click<9'
    'python-jedi>=0.18.0'
    'python-markdown>=3.6' 'python-markdown<4'
    'python-pymdown-extensions>=10.15' 'python-pymdown-extensions<11'
    'python-pygments>=2.19' 'python-pygments<3'
    'python-tomlkit>=0.12.0'
    'python-yaml>=6.0.1'
    'uvicorn>=0.22.0'
    'python-starlette>=0.37.2'
    'python-websockets>=14.2.0'

    # For Python 3.11~3.13
    # All RTC tests were disabled for other versions, not sure it is unsupported or not required
    'python-loro>=1.5.0'

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
sha512sums=('c2efcaaa3b65f54d01a6de5b9e6ca489235d4ddb4e55370d715a1b9613ff578fb7f0499164f774812e4a4416a891e29e68fe943f7c426624e71323bd479f3aab')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
}