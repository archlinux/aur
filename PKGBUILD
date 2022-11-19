# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mdurl
pkgname=python38-$_pkgname
pkgver=0.1.2
pkgrel=2
pkgdesc='URL utilities for markdown-it'
arch=('any')
url='https://github.com/executablebooks/mdurl'
license=('MIT')
depends=('python38-uc-micro-py')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core' 'python38-wheel')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e301ca3ab6d80df1ad28b9c2725d66b6e6cf139d93e5f7fd2a70333678616a3f6db64f15250972eee3cd1cf1eaff6ec587415629e6802dcf07995edff6865ff2')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build -nw
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src python3.8 -m pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
