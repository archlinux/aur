# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=wmcompanion
pkgver=0.3.0
pkgrel=1
pkgdesc="Desktop system event listener for minimal window manager users"
url="https://github.com/kriansa/wmcompanion"
arch=(any)
license=(Apache)
depends=(python python-dbus-next)
makedepends=(python-poetry python-installer)
source=("https://github.com/kriansa/wmcompanion/archive/v${pkgver}.tar.gz")
sha256sums=(ef3c6cb2992d4c57ca8248c4ed52570e725a2c3e3f0d23b9b4a666a3cd53388e)

build() {
  cd "$pkgname-$pkgver" || exit 1
  poetry build -f wheel
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
