# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-subtests
pkgver=0.9.0
pkgrel=1
pkgdesc='unittest subTest() support and subtests fixture'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-subtests'
depends=('python38-pytest')
makedepends=('python38-setuptools-scm')
source=("https://github.com/pytest-dev/pytest-subtests/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f1bc2b99e6f04864cdc45675574d32821fd5e08c01c937bddc846ac509cd8906d21ee63b11e9e8a87c2631334541e9adc601a7dd69702572d51c3d4b72443ad2')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-subtests-$pkgver
  python3.8 setup.py build
}

check() {
  cd pytest-subtests-$pkgver
  python3.8 setup.py egg_info
  PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-subtests-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
