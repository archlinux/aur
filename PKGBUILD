# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgver=3.1.2
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
sha512sums=('3ef57ecf0153235140613529ccdb800a63a78764ce21002e5cbfb65464e67c41786ee6f3a1d5ba9fce7dcfb9a330bd9d371584c0d1990bc336742c62bad863b0')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${pkgname}-${pkgver}"
#   python setup.py test
# }

package() {
  cd "${pkgname}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
