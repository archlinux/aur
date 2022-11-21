# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-cppy
pkgver=1.2.1
pkgrel=2
pkgdesc="A collection of C++ headers which make it easier to write Python C extension modules"
url="https://github.com/nucleic/cppy"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest')
source=("https://github.com/nucleic/cppy/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f6493830a8a66f52fff7c592db9d255fd7178ba320faee6a96258f29b6f299ffeca83f001650390b05c1037eb1350b0bd4da701d77a7bcb1a1babc108b7b8f97')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd cppy-$pkgver
  python3.8 -m build -wn
}

check() {
  cd cppy-$pkgver
  python3.8 -m pytest
}

package() {
  cd cppy-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
