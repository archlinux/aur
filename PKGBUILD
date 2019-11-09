# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=3.6.1.0
pkgrel=3
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('d0250d30bc22340ef0931df6c909c6353fcda486d0a9100c3ec922ce8284bb0b359faba2d696ddc3ddb8eb4dc7d8e07fe7e2f2cf3244b67a5ed90ebad8c5f68b')

prepare() {
  sed -i 's/< *5/<6/' billiard-$pkgver/requirements/test.txt
}

build() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py pytest
}

package() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir"/billiard-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
