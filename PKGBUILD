# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=pypinfo

pkgname=python-pypinfo
pkgver=16.0.0
pkgrel=1
pkgdesc="View PyPI download statistics with ease."
arch=('any')
url="https://github.com/ofek/pypinfo"
license=('MIT')
depends=(
  'python>=3.5'
  'python-appdirs'
  'python-binary'
  'python-click'
  'python-google-cloud-bigquery>=0.29.0'
  'python-tinydb'
  'python-tinyrecord'
)
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "https://github.com/ofek/pypinfo/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '87c4d5e007a57db51fbd5522a74531bab9b2593fba0cb2063e1f079226d5666c'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 AUTHORS.rst "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS.rst"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
