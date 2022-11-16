# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=4.0.35
pkgrel=1
pkgdesc="ODBC module for Python"
arch=('x86_64')
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('140987cfc9115aa96631dc1571e897b75026abe12f5bb99c8ab59081d3e0e3d438a0310404a562b1d43b9752c751296994b397844c5bf14fe0284c00bdef8847')

prepare() {
  echo "Version: ${pkgver}.0" >${_base}-${pkgver}/PKG-INFO
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "$pkgdir"/usr/pyodbc.pyi
}
