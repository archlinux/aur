# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-glanceclient
pkgver=4.1.0
pkgrel=2
pkgdesc="OpenStack Image API Client Library"
arch=('any')
url="https://docs.openstack.org/developer/python-glanceclient"
license=('Apache')
depends=('python38-pbr' 'python38-prettytable' 'python38-keystoneauth1' 'python38-requests' 'python38-warlock'
         'python38-oslo-utils' 'python38-oslo-i18n' 'python38-wrapt' 'python38-pyopenssl')
makedepends=('python38-setuptools')
checkdepends=('python38-stestr' 'python38-ddt' 'python38-requests-mock' 'python38-testscenarios')
options=('!emptydirs')
source=("https://github.com/openstack/python-glanceclient/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f39d82ffe2279bf7eaf741d9dcca3678f3f7f064183c6dc5e1849b24d08497335caebaf8a9db2f65b145191f449af79f370c0e0dadb6df6e9801b941a4277756')

export PBR_VERSION=$pkgver

build() {
  cd python-glanceclient-$pkgver
  python3.8 setup.py build
}

check() {
  cd python-glanceclient-$pkgver
  stestr run
}

package() {
  cd python-glanceclient-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
