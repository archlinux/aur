# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-os-service-types
pkgver=1.7.0
pkgrel=9
pkgdesc="Python library for consuming OpenStack sevice-types-authority data"
arch=('any')
url="https://pypi.python.org/pypi/os-service-types/$pkgver"
license=('Apache')
depends=('python38-pbr')
checkdepends=('python38-oslotest' 'python38-requests-mock')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/os-service-types/archive/$pkgver.tar.gz")
sha512sums=('df5848d648a9181dabd33fa734b556ea3799e8b06d0d4ba9f440c66bf7e942b5d65a5ffbd00fadfc61705a702fce3aa2b5d601a5ebde23a1da7259a712c4c0d5')

export PBR_VERSION=$pkgver

prepare() {
  echo "global-include *.json" >> os-service-types-$pkgver/MANIFEST.in
}

build() {
  cd os-service-types-$pkgver
  python3.8 setup.py build
}

check() {
  cd os-service-types-$pkgver
  stestr run
}

package() {
  cd os-service-types-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
