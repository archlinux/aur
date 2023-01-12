# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-dateparser
pkgver=1.1.6
pkgrel=1
pkgdesc="python parser for human readable dates"
url="https://github.com/scrapinghub/dateparser"
arch=('any')
license=('custom:bsd')
depends=(
  'python-dateutil'
  'python-regex'
  'python-tzlocal'
  'python-ruamel-yaml'
  'python-pytz'
  'python-gitpython'
  'python-convertdate' # AUR
  'python-hijri-converter' # AUR
)
optdepends=(
  'python-fasttext' # AUR
  'python-langdetect'
)
makedepends=('python-setuptools')
#checkdepends=(
#  'python-pytest'
#  'python-parameterized'
#  'python-pymeeus' # AUR
#)
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/scrapinghub/dateparser/archive/v${pkgver}.tar.gz")
sha256sums=('defda3336de096a59341d5ef0c6dda0e96de28a91eca4957ed683fa379194c35')

build() {
  cd "${pkgname#python-}-${pkgver}"

  python setup.py build
}

# Currently: 2260 failed, 21272 passed, 14 skipped, 15 warnings in 253.79s (0:04:13)
#check() {
#  cd "${pkgname#python-}-${pkgver}"

#  python -m pytest
#}

package() {
  cd "${pkgname#python-}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
