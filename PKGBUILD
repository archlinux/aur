# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-oslo-config
pkgver=9.0.0
pkgrel=2
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.python.org/pypi/oslo.config/$pkgver"
license=('Apache')
depends=('python38-six' 'python38-netaddr' 'python38-stevedore' 'python38-debtcollector'
         'python38-oslo-i18n' 'python38-rfc3986' 'python38-yaml')
makedepends=('python38-setuptools')
checkdepends=('python38-oslotest' 'python38-sphinx' 'python38-requests-mock' 'python38-oslo-log')
options=('!emptydirs')
source=("https://github.com/openstack/oslo.config/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-cliff-3.4.patch::https://opendev.org/openstack/oslo.config/commit/78098e6b18026ff9ef03a948b57348f02d42e13b.patch)
sha512sums=('f8de473d4693d18c145f360f59eeded2d4ad8e0d2fb6de9b6f394f87ced5673c2eaab501c674c5b6469dc5477250cb3877227ac987e33ab44acaa9fc4ade8421'
            '34d302cad1a6818773ee5093a20e41c18bfaac88a21d9b916f56f60eac566c9d3e9b18cc434920af079a0e7501e2ca51f7c56427e2eff2f90de911019639cd23')

export PBR_VERSION=$pkgver

prepare() {
  cd oslo.config-$pkgver
  patch -p1 -i ..//$pkgname-cliff-3.4.patch
}

build() {
  cd oslo.config-$pkgver
  python3.8 setup.py build
}

check() {
  cd oslo.config-$pkgver
  stestr run
}

package() {
  cd oslo.config-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
