# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=python-apache-libcloud
pkgver=2.4.0
pkgrel=2
pkgdesc="A standard Python library that abstracts away differences among multiple cloud provider APIs"
arch=('any')
url="https://libcloud.apache.org"
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pytest-runner' 'openssh' 'python-requests-mock')
source=("https://pypi.io/packages/source/a/apache-libcloud/apache-libcloud-${pkgver}.tar.gz"{,.asc})
sha512sums=('0926164a2514bc3e292c06d83713fb07204b747f06b34e25daead272b33eeb568d803babc7c971a85be0ecf0f425b90a1209b8f9beea94f42dc3522271292be1'
            'SKIP')
validpgpkeys=('3ACBB4086C01F7376628088CAB4A19AE1CE85744'  # Anthony Shaw <anthonyshaw@apache.org>
              '35542BB9C0C01D5E5478BADE6A61AF8545413203') # Quentin Pradet <quentin.pradet@gmail.com>

build() {
  cd apache-libcloud-$pkgver
  python setup.py build
}

check() {
  cd apache-libcloud-$pkgver
  cp libcloud/test/secrets.py-dist libcloud/test/secrets.py
  python setup.py test
  rm libcloud/test/secrets.py
}

package() {
  cd apache-libcloud-$pkgver
  python setup.py install --root="$pkgdir"
}
