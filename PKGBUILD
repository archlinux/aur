# Maintainer: graysky <therealgraysky AT proton DOT me>
#
# HC-SR04 ultrasonic distance sensor driver for Raspberry Pi, using lgpio
# for GPIO access. Provides the `pinsource` module and CLI tool that
# raspisump uses to take depth readings.

pkgname=python-pinsource
_name=pinsource
pkgver=1.0
pkgrel=1
pkgdesc="HC-SR04 ultrasonic sensor driver for Raspberry Pi (used by raspisump)"
arch=('any')
url="https://github.com/alaudet/pinsource"
license=('Apache-2.0')
depends=('python' 'python-lgpio')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/alaudet/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5e4e61b2b67972caae4779c96197133eb06de5f03923b1375d579ae3a3684ecf')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
