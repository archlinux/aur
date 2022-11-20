# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-debtcollector
pkgver=2.5.0
pkgrel=1
arch=('any')
pkgdesc='A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner.'
url='https://docs.openstack.org/developer/debtcollector'
license=('Apache')
depends=('python38-wrapt')
makedepends=('python38-pbr')
checkdepends=('python38-stestr')
source=("https://github.com/openstack/debtcollector/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a6f00eece3e5fa61feef39a4d10f82f81a2548eac06b2650b2caea2ee525ce886db0994053b64032adf06171d94dfb7f90af06acc56ddde76a62188ee8f4f9ae')

export PBR_VERSION=$pkgver

build() {
  cd debtcollector-$pkgver
  python3.8 setup.py build
}

check() {
  cd debtcollector-$pkgver
  stestr run
}

package() {
  cd debtcollector-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
