# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pyhamcrest
pkgver=2.0.4
pkgrel=1
pkgdesc="Hamcrest framework for matcher objects"
arch=('any')
license=('BSD')
url="https://github.com/hamcrest/PyHamcrest"
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling' 'python38-hatch-vcs')
checkdepends=('python38-pytest')
source=("https://github.com/hamcrest/PyHamcrest/archive/V$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6ee558fe04dce839d5d5d20b90ecf82fed96570e1c5b3a827fce19dba167bf4702ea707560b19e2d6e82be20913deb6cf17fa7e140733899a92abb28e9f2aa56')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd PyHamcrest-$pkgver
  python3.8 -m build -nw
}

check() {
  cd PyHamcrest-$pkgver
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd PyHamcrest-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
