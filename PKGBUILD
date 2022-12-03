# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=pywikibot
pkgname=python-${_base}
pkgver=7.7.2
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
url="https://www.mediawiki.org/wiki/Manual:${_base}"
license=(MIT)
arch=(any)
depends=(python-requests python-setuptools python-mwparserfromhell)
optdepends=('python-wikitextparser: parsing MediaWiki wikicode'
  'python-stdnum: cosmetic changes for numbers') # python-sseclient python-pydot python-google python-pymysql python-pillow python-mwoauth python-beautifulsoup4 python-fake-useragent flake8 python-darglint python-flake8-bugbear python-flake8-coding python-flake8-colors python-flake8-comprehensions python-flake8-docstrings python-flake8-future-import python-verve-flake8-mock python-flake8-print python-flake8-quotes python-flake8-string-format python-flake8-tuple python-flake8-no-u-prefixed-strings python-pep8-naming python-hacking
source=(${_base}-${pkgver}.tar.gz::https://github.com/wikimedia/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('ca7886d1806678848eaeb3940ff054c81f0970bedd0f6362aa4883fad5225b29b35d311e29c160578e44ca6007c4cdfd660a640fd3698103b3c4b0e4eb978d54')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
