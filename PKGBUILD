# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-black
pkgver=0.3.7
pkgrel=3
pkgdesc="A pytest plugin to enable format checking with black"
arch=('any')
license=('MIT')
url="https://github.com/shopkeep/pytest-black/"
depends=('python-black' 'python-pytest')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shopkeep/pytest-black/archive/$pkgver.tar.gz")
sha512sums=('2dfd4fb020c29eddcb21a2311f3e0b2ca8b6f2406de057d48cf574aa108136d9a59e252f7e364892fdaf83e2a326d94d718278208b312bbaf46e3033d19b1af7')

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
