pkgname=python-gradio
pkgver=3.9.1
pkgrel=1
pkgdesc='Create UIs for your machine learning model in Python in 3 minutes '
arch=(x86_64)
url='https://github.com/gradio-app/gradio'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/gradio-app/gradio/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9291a100d16f2b44117846880f80c9862ef7bc461fd178a619a78fbe63a6b2effc5fdb8a7a21aac01b760f14e9bc12bf0bdd4a275e3374012b69d57208fab7cb')
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
