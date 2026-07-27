# Maintainer: Marc Rechté <marc4@rechte.fr>

_name=fastapi-cli
pkgname=python-$_name
pkgver=0.0.32
pkgrel=1
pkgdesc='Run and manage FastAPI apps from the command line with FastAPI CLI'
arch=(any)
url="https://github.com/tiangolo/fastapi-cli"
license=(MIT)

depends=(
  python
  python-typer
  python-rich-toolkit
)

makedepends=(
  python-build
  python-installer
  python-pdm-backend
)

optdepends=(
  'fastapi: FastAPI framework, high performance, easy to learn, fast to code, ready for production'
  'uvicorn: Uvicorn as ASGI server'
)

source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('36187ac78d7fb6eaaf5c26a9ca24a19336f1d98b44b433b0ff13290091320da5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

