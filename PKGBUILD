# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.22.0
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
sha512sums=('fcd9f18646dd78fbdea4657b403fda750ac8bfc2458aa89c2d5fcefbc0401e73164f86e870db7830df2034db0d459dcda6de042c59df0d4e94e483efbad7b184')

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
