# Maintainer: user14923929
pkgname=pocketpsp
pkgver=0.1.0
pkgrel=1
pkgdesc="Write Sony PSP homebrew games in a restricted Python DSL compiled to C"
arch=('any')
url="https://github.com/user14923929/psp-game-studio"
license=('GPL-3.0-only')
depends=('python>=3.11' 'make')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('ppsspp: run built games with "pocketpsp run"')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1245488fd63c8f396058109355fe9c28bc23291c7434e7577d0401b2636cac7a')

build() {
  cd "psp-game-studio-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "psp-game-studio-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
