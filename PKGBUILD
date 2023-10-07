# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=pywikibot
pkgname=python-${_base}
pkgver=8.4.0
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
url="https://www.mediawiki.org/wiki/Manual:${_base}"
license=(MIT)
arch=(any)
depends=(python-requests python-setuptools python-mwparserfromhell)
makedepends=(python-build python-installer python-wheel)
optdepends=('python-wikitextparser: parsing MediaWiki wikicode'
  'python-stdnum: cosmetic changes for numbers')
# python-sseclient python-pydot python-google python-pymysql python-pillow python-mwoauth python-beautifulsoup4 python-fake-useragent flake8 python-darglint python-flake8-bugbear python-flake8-coding python-flake8-colors python-flake8-comprehensions python-flake8-docstrings python-flake8-future-import python-verve-flake8-mock python-flake8-print python-flake8-quotes python-flake8-string-format python-flake8-tuple python-flake8-no-u-prefixed-strings python-pep8-naming python-hacking
source=(${_base}-${pkgver}.tar.gz::https://github.com/wikimedia/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('b3f63ed7296a18b6d2b6efc7a88f3c00458cab2b856dd7a3e66edf6d3f10c2cb6a0beecf333637f9b686e2a891af4314f91fb769dc286305551fdcf8725e6ec3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
