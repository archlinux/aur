# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-cliff
pkgver=4.1.0
pkgrel=1
pkgdesc="Command Line Interface Formulation Framework"
arch=('any')
url="https://docs.openstack.org/cliff/latest/"
license=('Apache')
depends=('python38-six' 'python38-cmd2' 'python38-prettytable' 'python38-importlib-metadata'
         'python38-stevedore' 'python38-yaml' 'python38-autopage')
makedepends=('git')
checkdepends=('python-stestr' 'python38-sphinx' 'python38-testscenarios')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/cliff/archive/$pkgver.tar.gz")
sha512sums=('185ccceddebee30f813dff8d95d46d884a2911249741d4b418cf2112c9d19675d78f94b7b138aa485cb93248296b23b8e2a6d949af4fd0c81eb04704cb5a6c75')

export PBR_VERSION=$pkgver

build() {
  cd cliff-$pkgver
  python3.8 setup.py build
}

check() {
  cd cliff-$pkgver
  stestr run
}

package() {
  cd cliff-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
