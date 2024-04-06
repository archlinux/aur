# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy
pkgver=1.6
pkgrel=4
pkgdesc="Lazy attributes for Python objects"
url="https://github.com/stefanholek/lazy"
license=('BSD-2-Clause')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stefanholek/lazy/archive/$pkgver.tar.gz")
sha512sums=('b6e89fdf33840c9f70f13129c4c43d5d21e72897a2ae6d8f5dcfe4145fca41492e76f83a1d4c1a26f90ac8cd9e4c88c9f55187ae4fa044ccb6ca640d8907c4dc')

build() {
  cd lazy-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd lazy-$pkgver
  python -m unittest discover
}

package() {
  cd lazy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
