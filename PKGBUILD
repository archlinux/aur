# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>

pkgname=('python-filterpy' 'python2-filterpy')
pkgver=1.4.5
pkgrel=2
pkgdesc='Kalman filtering and optimal estimation library'
arch=('any')
url='https://github.com/rlabbe/filterpy'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fc371ad800ca5a5ff8b8352894a09c353b794ccc8b813c03d5187df451ccef3a')

prepare() {
  cp -a "filterpy-$pkgver" "filterpy-$pkgver-py2"
}

build() {
  pushd "filterpy-$pkgver"
  python setup.py build
  popd

  pushd "filterpy-$pkgver-py2"
  python2 setup.py build
}

package_python-filterpy() {
  depends=('python-numpy' 'python-scipy' 'python-matplotlib')

  cd "filterpy-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python2-filterpy() {
  depends=('python2-numpy' 'python2-scipy' 'python2-matplotlib')
  install=py2.install

  cd "filterpy-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
