# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-micropie
pkgver=0.26
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
sha256sums=('1f3c1e03502d7652223259935b359c2237376b29327f894da089d5daa0c71110')

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
