# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgver=3.2.5
pkgrel=1
pkgdesc="A multi format lossless image optimizer that uses external tools"
url="https://github.com/ajslater/${pkgname}"
depends=(python-confuse python-humanize python-dateutil python-rarfile python-treestamps python-pillow python-argparse optipng)
makedepends=(python-setuptools)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
license=(GPL2)
arch=(any)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0e6bad21fcab9ed1ed29e9b32362b44f5b1e6e48ce390b90e945ac4d446e8fbd047f43ae112c61ffb5c4f901a11be51d2c500a2c3e2fd9e6f5b2ddfb33cbb917')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

# check() {
#   cd ${pkgname}-${pkgver}
#   python setup.py test
# }

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
