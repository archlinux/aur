# Maintainer: Marc Rechté <marc4@rechte.fr>

_name=fastapi-cli
pkgname=python-$_name
pkgver=0.0.4
pkgrel=1
pkgdesc='Run and manage FastAPI apps from the command line with FastAPI CLI'
arch=(any)
url="https://github.com/tiangolo/fastapi-cli"
license=(MIT)

depends=(
  python
  python-typer
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
sha256sums=('094c11ac845917033e6eb84b1005b34592f80a2dcd21f3dc3e0091ff6e31fe61')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

