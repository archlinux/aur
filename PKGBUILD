# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=3.3.4
pkgrel=1
arch=(any)
url="https://github.com/ajslater/${pkgname}"
license=(GPL3)
depends=(python-confuse python-humanize python-dateutil python-rarfile python-treestamps python-pillow optipng)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('33adfa58b76ccde19903a946eb2ca7c51c1bd7480132c5e4603bd33e777e0400098cb8a53bc290201707f2f9589402d0b0391295490077709ca16f7a7b015ea9')

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
