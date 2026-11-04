# Maintainer: Thorben Günther <admin@xenrox.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>

pkgname=python-billiard
pkgver=4.3.2
pkgrel=2
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('7c78a8e31ca2f4f932c4a82319b2c468558367cd89f1fcdba301f67f81b1d586b8f54c14072e7fc950c854bebca0c0bc3227ce8d97f1476382ac027440b184e7')

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
  PYTHONPATH="$PWD" pytest -v
}

package() {
  cd billiard-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm664 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
