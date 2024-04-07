# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=4.2.0
pkgrel=3
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('8f25cd44416cb5b89a4e511189d8381f7bd0b0bc15597d2adb4b4e3fe3542a651acd7803dea43dcf0a94e2be6347d509393dac7dcabf2902a5f81b3cad8b0685')

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
