# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.26.0
pkgrel=1
pkgdesc="TUI File Browser App"
arch=(any)
url="https://github.com/juftin/${pkgname}"
license=(MIT)
depends=(python-art python-pandas python-rich-click python-rich-pixels
  python-textual-universal-directorytree python-pillow python-pymupdf python-pyperclip)
makedepends=(python-build python-installer python-hatchling python-wheel)
# checkdepends=(python-pytest python-requests)
optdepends=('python-pyarrow')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0abbb0ae389d7d8737cf551254fb173112d2b024f62699965c0b7ed3ecafe63cd40b2fdb51de504f539a2b56e20e03252dcb2ac3fc1f76dac7334747b446f9df')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${pkgname}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest \
#     --ignore=tests/test_browsr.py \
#     --ignore=tests/test_cli.py
# }

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
