# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=python-pyodbc
_srcname=pyodbc
pkgver=4.0.32
pkgrel=2
pkgdesc='ODBC module for Python'
arch=('x86_64')
url='https://github.com/mkleehammer/pyodbc'
license=('MIT')
depends=('python' 'unixodbc')
source=(https://github.com/mkleehammer/pyodbc/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4ed213d0f67d639d03d37de52a613a4e5a0da113e6d0d56e90dca09d7060470c')

prepare() {
  echo "Version: ${pkgver}.0" > ${_srcname}-${pkgver}/PKG-INFO
}

build() {
  cd ${_srcname}-${pkgver}

  python setup.py build
}

package() {
  cd ${_srcname}-${pkgver}

  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  rm "$pkgdir"/usr/pyodbc.pyi
}
