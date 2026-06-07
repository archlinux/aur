# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=6.5.2
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
sha512sums=('f24d760f016a9f22400b9db6c63036248b207a3b2bfb46957c824e734ad323e7fb2627ecf7253b7e554e25e2302d0863ffead20bbef88883ca4cc745ba6bf209')

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
