# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=5.1.1
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
sha512sums=('e8767895fdae41a3311d988a51a222eebba8e528033a26b19e1e99ce196a79ad1766b74e3ad2ab09ab6ab4bfebb66b379573b631631e7ad1bfed9baa2307fecd')

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
