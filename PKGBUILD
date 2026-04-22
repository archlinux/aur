# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.24.0
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
sha512sums=('3e670f2c98b50aa53ba4f74bb716874d3c2d6f66e447597068200389f847a2cb2bba4628835a863b5f49188cdc7bec3913b43435744e053aa1e6adc2827ff6fd')

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
