# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgver=3.2.3
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
sha512sums=('2581280433b0eeae3a2e1c056becf09630e42f95809b37df4f45b4d6b75d3059179fd0c2b4ce420e5dafe73faccfdc345f254a57deafd2cf2d4f5c235cd3c1da')

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
