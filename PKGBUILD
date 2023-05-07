# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=3.2.5
pkgrel=2
arch=(any)
url="https://github.com/ajslater/${pkgname}"
license=(GPL2)
depends=(python-confuse python-humanize python-dateutil python-rarfile python-treestamps python-pillow python-argparse optipng)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0e6bad21fcab9ed1ed29e9b32362b44f5b1e6e48ce390b90e945ac4d446e8fbd047f43ae112c61ffb5c4f901a11be51d2c500a2c3e2fd9e6f5b2ddfb33cbb917')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${pkgname}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python setup.py test
# }

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
