# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=curses-menu
pkgname=python-${_base}
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
# options=(!emptydirs)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('e0c1c0fe5677db76febf8f5f71bf167ced45c045bdfaa24bcfd434948246e095ae0a37e41a1213b065fba2ffb91bd68a2a81311c94a69e1ad2f82920904ebe32')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
