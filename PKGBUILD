# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Greene <mgreene@securityinnovation.com>

pkgname=python-solid
pkgver=1.1.1
pkgrel=1
pkgdesc='Python interface to the OpenSCAD declarative geometry language'
arch=('any')
url='https://github.com/SolidCode/SolidPython'
license=('LGPL')
depends=('python-euclid3' 'python-prettytable' 'python-pypng' 'python-regex' 'python-ply')
makedepends=('python-setuptools' 'python-dephell')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d475f99632bf2da41585cd3cc52d9cd5059721188aee34edcc4b9508fbb23aa1')

prepare() {
  cd "SolidPython-$pkgver"
  sed -i 's/\^tox/tox/' pyproject.toml
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "SolidPython-$pkgver"
  python setup.py build
}

package() {
  cd "SolidPython-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
