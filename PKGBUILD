# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=zimports

pkgname=python-zimports
pkgver=0.1.3
pkgrel=1
pkgdesc="yet another import fixing tool"
arch=('any')
url="https://github.com/sqlalchemyorg/zimports"
license=('BSD')
depends=(
  'python-pyflakes'
  'python-flake8-import-order'
)
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/17/9e/ff7223a7ead8c064435b6200267b1abb5b34c71822ad2ea6d4eaaed8862e/zimports-${pkgver}.tar.gz"
)
sha256sums=(
  '1297e0ecfc80dfe746cef3142ae9614eab1bf56ef75176fdea75a0915ab073e7'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  # LICENSE file is wrong (MIT but not BSD).
  # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
