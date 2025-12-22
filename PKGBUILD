# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_troveclient
pkgname=python-troveclient
pkgver=8.9.0
pkgrel=1
pkgdesc='Client library for OpenStack DBaaS API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-prettytable python-requests python-oslo-i18n
         python-oslo-utils python-babel python-keystoneauth1 python-six
         python-swiftclient python-mistralclient python-osc-lib)
checkdepends=(python-fixtures python-oslotest python-openstackclient
              python-requests-mock python-stestr python-testscenarios
              python-testtools python-httplib2)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz"
        'trove.bash_completion')
sha512sums=('c37eff13af16c8e420ebd9d53ecb352045894f69050b5ebd0a91c0abce0d68e5575db16378de21c6e19c635df4642f89cbef4fc0ed4878b45b203a62d3c9e9a4'
            '53a8603e7add596e847fcfcea9b454168956af581fb48794ab0ac08f6dce1d8c71ef47682e8b974bf184fc19e8473d362c75e9d70cd99d761ca7e113ea1f0ee9')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -D --mode 644 $srcdir/trove.bash_completion $pkgdir/usr/share/bash-completion/completions/trove
}
