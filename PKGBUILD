# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=4.0.0
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('af208a9bb38b35ecc5f36cf284da85fcab6954bbd213635cc7b82d699ac35bc5343f33b93e603ec358b70f138b432bf7e9f940c1290570ebf02b2227bc46739a')

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
