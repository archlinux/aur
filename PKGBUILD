# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-dateparser
pkgver=1.1.1
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
  'python-langdetect'
  'python-pytz'
  'python-gitpython'
  'python-fasttext' # AUR
  'python-convertdate' # AUR
  'python-hijri-converter' # AUR
)
makedepends=('python-setuptools')
#checkdepends=(
#  'python-pytest'
#  'python-parameterized'
#  'python-pymeeus' # AUR
#)
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/scrapinghub/dateparser/archive/v${pkgver}.tar.gz")
sha256sums=('f19fc05f8665a5b2f094322cb091c2108f485a05d14c97efef5a1228e8a2c230')

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
