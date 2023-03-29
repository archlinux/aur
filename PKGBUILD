# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=pywikibot
pkgname=python-${_base}
pkgver=8.0.3
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
url="https://www.mediawiki.org/wiki/Manual:${_base}"
license=(MIT)
arch=(any)
depends=(python-requests python-setuptools python-mwparserfromhell)
optdepends=('python-wikitextparser: parsing MediaWiki wikicode'
  'python-stdnum: cosmetic changes for numbers')
# python-sseclient python-pydot python-google python-pymysql python-pillow python-mwoauth python-beautifulsoup4 python-fake-useragent flake8 python-darglint python-flake8-bugbear python-flake8-coding python-flake8-colors python-flake8-comprehensions python-flake8-docstrings python-flake8-future-import python-verve-flake8-mock python-flake8-print python-flake8-quotes python-flake8-string-format python-flake8-tuple python-flake8-no-u-prefixed-strings python-pep8-naming python-hacking
source=(${_base}-${pkgver}.tar.gz::https://github.com/wikimedia/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('7e80f0ed71367b49cd6f6e436fec978186003f1b38e2d2ee5a563782549801f99cecc0ee70f2120a1fc589be41bd85caecb08e1922b70b76bb2a67bcb010520c')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
