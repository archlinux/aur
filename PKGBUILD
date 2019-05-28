# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-black
pkgver=0.3.6
pkgrel=1
pkgdesc="A pytest plugin to enable format checking with black"
arch=('any')
license=('MIT')
url="https://github.com/shopkeep/pytest-black/"
depends=('python-black' 'python-pytest')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shopkeep/pytest-black/archive/$pkgver.tar.gz")
sha512sums=('0f10951fcfdaff4612dbea20215328f78dd43945698cf99b6714e39bc195cd2e08616f189ee9081932a12271f81f4f3d847beadc1bb1a3ebed60d7c6edd1ab37')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-black-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-black-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd pytest-black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
