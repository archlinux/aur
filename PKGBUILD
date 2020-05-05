# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-black
pkgver=0.3.9
pkgrel=1
pkgdesc="A pytest plugin to enable format checking with black"
arch=('any')
license=('MIT')
url="https://github.com/shopkeep/pytest-black/"
depends=('python-black' 'python-pytest')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shopkeep/pytest-black/archive/$pkgver.tar.gz")
sha512sums=('b8c4d459b325ff2f46b25311d5fbd8f5bf3ff63d1529591f603e16f04c357af31e5d5004f922abcf287533c67fbec7b8330097cb52f2f6a289ec42b6170adc10')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-black-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-black-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd pytest-black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
