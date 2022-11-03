# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgver=3.2.4
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
sha512sums=('6860cf81bbc5f6077d0039e01982cf4f4e9ddf8e5836a706d575685bbf1c6539ccdfe5a80cdec885390167790cf00fb41bcd171850d5c26fc7e469623650e350')

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
