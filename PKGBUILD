# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=6.5.0
pkgrel=1
arch=(any)
url="https://github.com/ajslater/${pkgname}"
license=(GPL-3.0-only)
depends=(python-confuse python-humanize python-piexif python-pyoxipng
  python-dateutil python-rarfile python-treestamps python-pillow)
makedepends=(python-build python-installer python-poetry-core python-wheel)
# checkdepends=(python-pytest-cov)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ad43e0ed6811c3e7d8345d7b374948e76fd715feb5c0a561fae42865b85c31e83b09acc7379b4a18f34d672da10cc5986c591b1c4c890e5bd21f200f692665bc')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${pkgname}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest \
#     -k 'not containers and not images_dir and not mpo and not old_timestamps and not one_container and not preserve and not timestamps'
# }

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
