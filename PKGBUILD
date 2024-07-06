# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-troveclient
pkgver=8.5.0
pkgrel=2
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
sha512sums=('eb5f35928e06146e4bcb9573653b3d6c831c5c039448e3d405e5818818a39d30cba22dfaca1d1da6f00db0d8506fffc769cf82a5f1604c1dcbf2629bfbf983f8'
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
