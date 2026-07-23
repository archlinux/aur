# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci at gmail dot com>
# Contributor: Dunky <braxtinmoss13@gmail.com>

pkgname=niri-companion
pkgver=5.0.0
pkgrel=1
pkgdesc="Niri companion scripts: config generation, IPC extensions, workspace management"
arch=('any')
url='https://github.com/dybdeskarphet/niri-companion'
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-pydantic'
  'python-rich'
  'python-tomli-w'
  'python-typer'
  'python-watchdog'
  'niri'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dybdeskarphet/niri-companion/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c54e5f9ff460763a0a3e3cb04654e18b4576abfa8aec40d9451c0f24e10c11fc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
}
