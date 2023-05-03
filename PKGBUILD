# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=wmcompanion
pkgver=0.6.4
pkgrel=1
pkgdesc="Desktop system event listener for minimal window manager users"
url="https://github.com/kriansa/wmcompanion"
arch=(any)
license=(Apache)
depends=(python python-dbus-next)
makedepends=(python-poetry python-installer)
optdepends=('python-xcffib: X11 functionality')
source=("https://github.com/kriansa/wmcompanion/archive/v${pkgver}.tar.gz")
sha256sums=(4641545d5747e78ee84a03f5e854853ed29abfa83f91ed15d589d0df502a27c3)

build() {
  cd "$pkgname-$pkgver" || exit 1
  poetry build -f wheel
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
