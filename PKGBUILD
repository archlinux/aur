# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_base=flake8-blind-except
pkgname=python-${_base}
pkgver=0.2.1
pkgrel=1
pkgdesc="A flake8 extension that checks for blind except: statements"
arch=(any)
license=(MIT)
url="https://github.com/elijahandrews/${_base}"
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('1786cf2709b94844d5eec91a81e9f3854f548e0a980cc3b869e5cd919d29ddce6ceba2d64a76b4a0b9524bc28cabf6851f0d33430eb65668b7f4a16bcd089332')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
