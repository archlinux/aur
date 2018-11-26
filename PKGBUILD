# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>
# Contributor: Bluewind

pkgbase='python-pyzabbix'
pkgname=('python-pyzabbix' 'python2-pyzabbix')
pkgver=0.7.5
pkgrel=1
pkgdesc='Zabbix API Python interface'
arch=('any')
license=('LGPL2.1')
url='https://github.com/lukecyca/pyzabbix'
makedepends=(
  'python-setuptools' 'python-requests'
  'python2-setuptools' 'python2-requests'
)
checkdepends=(
  'python-pytest' 'python-httpretty'
  'python2-pytest' 'python2-httpretty'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lukecyca/pyzabbix/archive/${pkgver}.tar.gz")
sha256sums=('0835b6c84d41cee2e0862c4e0c644f49f6aba9bf882945f2c13eff713dbc535e')

build() {
  cd "${pkgname#python-}-${pkgver}"
  
  python setup.py build
  python2 setup.py build
}

check() {
  cd "${pkgname#python-}-${pkgver}"

  python -m pytest
  python2 -m pytest
}

package_python-pyzabbix() {
  depends=('python' 'python-requests')

  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pyzabbix() {
  depends=('python2' 'python2-requests')

  cd "${pkgname#python2-}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
