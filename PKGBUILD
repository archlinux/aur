# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-class-newline
pkgname=python-${_base}
pkgver=1.6.0
pkgrel=3
pkgdesc="Flake8 lint for newline after class definitions"
arch=('any')
url="https://github.com/AlexanderVanEck/${_base}"
license=(MIT)
depends=(flake8)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('83ea8fee354665cac61352a3356ffbe883577eb0adc9560477cad3daf021a547372cc3488a64e1bb2321265aaaa636385539edd57c07eafc3fcacc09e81801b2')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python setup.py test
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
