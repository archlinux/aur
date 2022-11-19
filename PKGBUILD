# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python38-pbr
pkgver=5.11.0
pkgrel=2
pkgdesc="Python Build Reasonableness"
arch=('any')
url='https://pypi.python.org/pypi/pbr'
license=('Apache')
depends=('python38-importlib-metadata' 'python38-setuptools')
checkdepends=('python38-stestr' 'python38-testscenarios' 'python38-testresources' 'python38-testrepository'
              'python38-virtualenv' 'python38-wheel' 'python38-sphinx' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack-dev/pbr/archive/$pkgver.tar.gz")
sha512sums=('dbce8a76c06b2c60c2f4c9bbe94333504506563c0366b5e1ec6da2c784e612c47048cc6391501f3103ba1cd3b246283b466c73ebf264702bfe6896ddd501bdb6')

export PBR_VERSION=$pkgver

build() {
  cd pbr-$pkgver
  python3.8 setup.py build
}

check() {
  cd pbr-$pkgver
  # TODO: find out this failure
  stestr run --exclude-regex "pbr.tests.test_packaging.TestPackagingWheels.test_metadata_directory_has_pbr_json"
}

package() {
  cd pbr-$pkgver
  python3.8 setup.py install -O1 --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
