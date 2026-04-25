# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-micropie
pkgver=0.28
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
# checkdepends=(
#   'python-pytest'
# )
source=("git+https://github.com/patx/micropie.git#tag=v$pkgver")
sha256sums=('9206e936dc8cca9bbf11301285548d602ef22a39e95618f537b3b9d1ea923beb')

build() {
    cd "micropie"

    python -m build --wheel --no-isolation
}

# check() {
#     cd "micropie"
#
#     pytest pytest --dist no -n 0 -s -v ./tests.py
# }

package() {
    cd "micropie"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
