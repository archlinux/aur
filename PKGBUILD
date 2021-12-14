# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgver=2.2.1
pkgrel=4
pkgdesc="A multi format lossless image optimizer that uses external tools"
url="https://github.com/ajslater/${pkgname}"
depends=(python-pillow python-dateutil python-rarfile python-argparse optipng python-setuptools)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
license=(GPL2)
arch=('any')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('7d34f61defb71780be89bf8ae30e6a9e0247db40fbce03ba0d715c6d1546efb95a569c426144a29a16c40ad392a7003644e6713842b845acc9ac0403ef0638d8')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${pkgname}-${pkgver}"
#   python -m pytest tests
# }

package() {
  cd "${pkgname}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
