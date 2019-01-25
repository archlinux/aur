# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=pypinfo

pkgname=python-pypinfo
pkgver=15.0.0
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
  '64de011de2e8fd61f57a555124b6b462f595cd0c08a239d009e397a1525d1ac4'
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
