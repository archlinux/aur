# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=python-billiard
pkgname=('python-billiard' 'python2-billiard')
pkgver=3.6.0.0
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-case' 'python2-case'
              'python-psutil' 'python2-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('0a71de026d2a781b83fe2c549ecbfe9b6fbd574d8067fc46ba7eca6b76633a123620853d22696df3563d050043cfe75b14b4b69bf5217e0af964aaa0bcbe08ff')

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
