# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=3.0.1
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
depends=('python' 'python-lockfile' 'python-setuptools')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-wheel')
checkdepends=('python-testscenarios' 'python-testtools')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
        3bbc4696.patch)
sha256sums=('6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5'
            'a65396fd70560e81ac2ccf4d016e9ea3ced6e7b4b14694bb4f30228d6fd07b49')
b2sums=('5e695e20814ebb19fba2d8040abf15ba0c43c08700638d8f6dfb4a046cd1018f4da2a2ee0eb7f7333bc3b4bbbc18a4d68b799fe56f8da0d2ec4371e3307e5b6a'
        'f8a7b626bab48b2dda8266f847d823b5dddeea8be18b2a0a7fa5d073f817a6d594286fa870fff7ad7d4f62fceafcdf5e7dd45a95c8e370bab207fe5d1ef6eb0c')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 -i ../3bbc4696.patch # Fix build
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover -v
}

package_python-daemon() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
