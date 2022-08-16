# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=birdseye
pkgname=python-${_base}
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
pkgver=0.9.4
pkgrel=1
arch=(any)
url="https://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python-flask-humanize python-sqlalchemy python-asttokens python-littleutils python-cheap_repr python-outdated python-cached-property)
makedepends=(python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-markupsafe python-pandas python-beautifulsoup4 python-selenium python-flask) # chromedriver
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('79fe0004c50075080a637b59fdf1731d95404f121770fb18c96377e36f629cbe51b85b2cd1b9bb603625ac995b0cf7f38636bcd530acf4e5d2e8db65ae64c988')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest -k 'not open_with_encoding_check and not against_files and not interface.py'
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t ${pkgdir}/usr/share/doc/${pkgname}
}
