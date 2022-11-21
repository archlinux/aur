# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-repeat
pkgver=0.9.1
pkgrel=3
pkgdesc='pytest plugin for repeating test execution'
arch=('any')
license=('MPL')
url='https://github.com/pytest-dev/pytest-repeat'
depends=('python38-pytest')
makedepends=('python38-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest-repeat/archive/v$pkgver.tar.gz")
sha512sums=('6820712ef0aeb03a5147e3f025d1ea6024c970b3027fb9f698f7ccadea83bbf9f1871e0b8ee3ca0bf4daece5f498a7f5016bca1b5816f535593521073ab8fb6b')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-repeat-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-repeat-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-repeat-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
