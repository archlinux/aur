# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-databricks-cli
pkgver=0.10.0
pkgrel=2
pkgdesc='open source tool which provides an easy to use interface to the
Databricks platform'
arch=('x86_64')
url='https://github.com/databricks/databricks-cli'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-requests' 'python-tabulate' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha256sums=('81dd789eb098f69b5e4d3662e524d85fd313e684641871a12a684ada280cd5ca')

_pkgname=databricks-cli

prepare() {
  sed -i 's/configparser >= 0.3.5/configparser>=0.3.5;python_version < "3.6"/g' ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
