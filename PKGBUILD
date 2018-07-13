# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=python-billiard
pkgname=('python-billiard' 'python2-billiard')
pkgver=3.5.0.4
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-case' 'python2-case')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('8957bda01e9cc0b4de609b321e9b65f0855436e1d70cce31304ab4586437f9215d1d08b7a208f7672a75c21a68585df32cea7e666af1cae6b615de9430d45c5c')

prepare() {
  cp -a billiard-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py build

  cd "$srcdir"/billiard-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py pytest

  cd "$srcdir"/billiard-$pkgver-py2
  python2 setup.py pytest
}

package_python-billiard() {
  depends=('python')

  cd "$srcdir"/billiard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir"/billiard-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-billiard() {
  depends=('python2')

  cd "$srcdir"/billiard-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir"/billiard-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
