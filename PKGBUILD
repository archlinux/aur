# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-forked
pkgver=1.4.0
pkgrel=2
pkgdesc='run tests in isolated forked subprocesses'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-forked'
makedepends=('python38-pytest' 'python38-setuptools-scm')
depends=('python38-pytest')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pytest-dev/pytest-forked/archive/v$pkgver.tar.gz")
sha512sums=('f5ccf71d7f335073b5cfef15d44a65b315824c1087017ee692118354fc2f17da697ed6b0a7d7030b6259a4c3ceb9356ebd015f7867f3b4a5673eae12fd9ec952')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd "$srcdir"/pytest-forked-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it
  cd "$srcdir"/pytest-forked-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" py.test
}

package() {
  cd pytest-forked-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
