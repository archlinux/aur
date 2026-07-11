# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=pywikibot
pkgname=python-${_base}
pkgver=11.5.0
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
url="https://www.mediawiki.org/wiki/Manual:${_base}"
license=(MIT)
arch=(any)
depends=(python-mwparserfromhell python-packaging python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-wikitextparser: parsing MediaWiki wikicode'
  'python-stdnum: cosmetic changes for numbers')
# python-sseclient python-pydot python-google python-pymysql python-pillow python-mwoauth python-beautifulsoup4 python-fake-useragent flake8 python-darglint python-flake8-bugbear python-flake8-coding python-flake8-colors python-flake8-comprehensions python-flake8-docstrings python-flake8-future-import python-verve-flake8-mock python-flake8-print python-flake8-quotes python-flake8-string-format python-flake8-tuple python-flake8-no-u-prefixed-strings python-pep8-naming python-hacking
source=(${_base}-${pkgver}.tar.gz::https://github.com/wikimedia/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('7c1f84dfb54706942aaf11b1a2a0ba699d185180396948f7f84852060579eb457ee7f48452b12ad3adb1cacfdafd723e8a3e51aa05c981dfc2295d498459fc3b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
