# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=python-billiard
pkgname=('python-billiard' 'python2-billiard')
pkgver=3.5.0.3
pkgrel=2
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-case' 'python2-case')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('f3a98e9b7af8c0b5741bcea915c0ff8d6e32e26d79637d14fc09ea85dd80693ea8205e13ac2d86e5035c377fdd6d769a2647b005dc10af8b106c75464458a808')

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
