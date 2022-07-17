# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=4.0.34
pkgrel=1
pkgdesc="ODBC module for Python"
arch=('x86_64')
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('eb18ebf9214c8d97992d8735a8aeb4a9e31bee7aeb06f8fcb62a8fa1b79cd8437f8400f679fba243e8f27375de3c440cd2a2bdec269d50c6c2df18be3358c5f7')

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
