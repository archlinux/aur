# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-micropie
pkgver=0.23
pkgrel=1
pkgdesc='An ultra micro ASGI web framework'
url="https://patx.github.io/micropie/"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-jinja'
  'python-orjson'
  'python-python-multipart'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("git+https://github.com/patx/micropie.git#tag=v$pkgver")
sha256sums=('5e6bec2e3b3f52cef4304ff1d60812d50cf7a2109caa254ed89cf3c4c8588c9e')

build() {
    cd "micropie"
    python -m build --wheel --no-isolation
}

check() {
    cd "micropie"
    pytest tests.py -v
}

package() {
    cd "micropie"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
