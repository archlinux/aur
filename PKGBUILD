_name=marimo
pkgname=marimo
pkgver=0.9.34
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://marimo.io/'
license=('Apache-2.0')

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
    'python-docutils'
    'python-psutil'
    'python-itsdangerous'
    'python-narwhals'
    'ruff'
    'python-packaging'
)

optdepends=(
    'python-typing_extensions: python <=3.10 support'
    'python-duckdb: SQL cells support'
    'python-altair: Plotting in datasource viewer'
    'python-polars: SQL output back in Python'
    'python-openai: AI features'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatch'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('50968e0906335be54e17873f4ad5893fdf73c970df112e147768ee8fd956084c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}