# Maintainer: Thorben Günther <admin@xenrox.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>

pkgname=python-billiard
pkgver=4.2.4
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('f05041661da59603da5bdcb3b696d75742d4cb7998f5bbf22474e001641f5be6cf693c3b329cda3e8983cc3fe56e5cc96a1d7880eefa5b2d68cd0d4ffe231626')

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
