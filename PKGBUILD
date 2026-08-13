# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-micropie
pkgver=0.32
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
sha256sums=('16ddafa15a6a19364212e33a1e6fa4a0181f73d0f7d3dc444b07ce854333cd13')

prepare() {
    cd "micropie"

    sed -i -e 's|requires = \[.*\]|requires = \[\"flit_core\"]|g' "./pyproject.toml"
}

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
