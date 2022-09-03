# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=4.0.1
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('242a0974e64a54bb568ea33a329af546ed075a0f65008cf374fdcbce0ce3ff5108e8fdeb6c2cc78e91516cf9bf8aef9ed0b1ed56b94c9aae500d83bb33cd4c39')

prepare() {
  cd billiard-$pkgver
  sed -i 's/< *5/<6/' requirements/test.txt
}

build() {
  cd billiard-$pkgver
  python setup.py build
}

check() {
  cd billiard-$pkgver
  python setup.py pytest
}

package() {
  cd billiard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm664 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
