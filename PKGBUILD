# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=4.1.0
pkgrel=2
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('b55b9a94564211261dfdacff15e462786d0a5ef0cdee3b9f44d2f7ee89a3659a027cb7686452a02ec3258479033e13e4d6a3ada61c2e7b2b3d4fa81afe4fdb88')

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
