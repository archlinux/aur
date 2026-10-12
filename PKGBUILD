# Maintainer: Thorben Günther <admin@xenrox.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>

pkgname=python-billiard
pkgver=4.3.1
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('e4f6db60610773c7109e1faa39c30417742c40ce23e8a0fd412d9c476acc60fadf4ef812074dedc8fb3f16d37fc25e07153510a3d535172bb58e21bb2f415add')

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
