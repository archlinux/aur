# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=3.6.2.0
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('ff04ac024ddca935fb9713226d288b4b3bf856ae52948f86c061e291c163343af34bf545f0b5ec727e643ba6566004d3b5a4684509b5169e0e45e8a64998219a')

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
