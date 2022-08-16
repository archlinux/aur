# Mantainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=cheap_repr
pkgname=python-${_base}
pkgdesc="Better version of repr/reprlib for short, cheap string representations"
pkgver=0.5.1
pkgrel=2
arch=(any)
url="http://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools-scm)
checkdepends=(python-pytest python-django)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fc4531da1c8618a85bc6957ac8410f3594f603e71943efa5fa37d2263dbde83a0f1c3a88357e3c7338595e5c4b7378b713a5bcfa18067eba8435633fcccb624a')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
