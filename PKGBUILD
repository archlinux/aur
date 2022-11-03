pkgname=python-gradio
pkgver=3.8.2
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a2e9bf22a2ae3452379638dccbb58178dcbd5bb74f2180ff0b65e47ee1720992f887c28c928cd160eda43ac20b020428fdd49b48aef421f0decc3bcf376a920d')
depends=(
    'python-aiohttp'
    'python-h11'
    'python-fastapi'
    'python-ffmpy'
    'python-markdown-it-py'
    'python-matplotlib'
    'python-numpy'
    'python-orjson'
    'python-pandas'
    'python-paramiko'
    'python-pillow'
    'python-pycryptodome'
    'python-python-multipart'
    'python-pydub'
    'python-yaml'
    'python-requests'
    'uvicorn'
    'python-jinja'
    'python-fsspec'
    'python-httpx'
    'python-pydantic'
    'python-websockets'
    'python-linkify-it-py'
    'python-mdit_py_plugins'
)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-requirements-txt python-hatch-fancy-pypi-readme pnpm)

build() {
    cd gradio-$pkgver
    sh ./scripts/build_frontend.sh
    python -m build --wheel --no-isolation
}

package() {
    cd gradio-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
