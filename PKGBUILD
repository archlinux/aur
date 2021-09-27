# Maintainer: Ilya Zakharov <pupa@egor.win>

pkgname=polundra
pkgver=0.1.7
pkgrel=1
pkgdesc="An extended alert notifier."
arch=('any')
url="https://github.com/smgd/polundra"
license=('MIT')
depends=('python' 'dbus-python' 'python-pulsectl')
makedepends=('python-poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('70806de1cb3912500dffb398dbc16b7d425cbecad769a79fcf33b4921828215c81ff3c9330a87ff0c8fe006f1c555b27d6c1fbb64562987ed0148db2bd31968c')

build() {
  cd "$pkgname-$pkgver"
  poetry build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
