# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=pywikibot
pkgname=python-${_base}
pkgver=9.6.0
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
sha512sums=('b921d472ee467d6dd0d0c748fe5e58e1e6024a142cc47194386c387fc2d381c031950455ae33a64c61b170376197bfc8cac6102ebdc28011ef01aa5dc7b790b2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
