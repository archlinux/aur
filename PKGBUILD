# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-autobuild
pkgname=python38-$_pkgname
pkgver=2021.03.14
pkgrel=1
pkgdesc='Rebuild Sphinx documentation on changes, with live-reload in the browser'
arch=('any')
url='https://github.com/executablebooks/sphinx-autobuild'
license=('BSD')
depends=('python38' 'python38-sphinx' 'python38-livereload')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6be06e129119f2ab9d6443fc04bd1f6005c154fd53f231124babe6fd5f6371e0c9d8b42b119ab3cf53926d17970894b6ee883c464384abaa98a152f61020ed90')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
