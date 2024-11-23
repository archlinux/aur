# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=4.2.1
pkgrel=2
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('f67d2eff08bb8175faf3b638e7566ed6bd22643eb05b3538026618263b9978f2e72fe9cb10c51f596088c1d217e2722969125e266d17a30a4d89ac10738a4818')

prepare() {
  cd billiard-$pkgver
  sed -i 's/< *5/<6/' requirements/test.txt
}

build() {
  cd billiard-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd billiard-$pkgver
  pytest -v
}

package() {
  cd billiard-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm664 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
