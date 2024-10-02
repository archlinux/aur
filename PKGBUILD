# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-troveclient
pkgver=8.6.0
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
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz"
        'trove.bash_completion')
sha512sums=('b8013ef0a93ac5538a0d9a2328826fce3b97125a75e33ef2fe5d9da49d4f2e4aa3fef7001fd0513d80b20836e52039d80a3ed617f5045a598a7e38eb21ef26c2'
            '53a8603e7add596e847fcfcea9b454168956af581fb48794ab0ac08f6dce1d8c71ef47682e8b974bf184fc19e8473d362c75e9d70cd99d761ca7e113ea1f0ee9')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D --mode 644 $srcdir/trove.bash_completion $pkgdir/usr/share/bash-completion/completions/trove
}
