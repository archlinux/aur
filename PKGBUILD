pkgname=ksteamtrayicon
pkgver=1.0.5
pkgrel=3
pkgdesc="Keeps the Steam tray icon in sync with the KDE Plasma color scheme"
arch=('any')
url="https://github.com/marcotuliomatos/ksteamtrayicon"
install=ksteamtrayicon.install
license=('MIT')
depends=(
  'python'
  'python-dbus-next'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'gzip'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('73ec3ffb719eec2e82a71dcb369c13127341f25b80c9624e2b1f0897a9f23063')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ksteamtrayicon.service \
    "$pkgdir/usr/lib/systemd/user/ksteamtrayicon.service"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 man/en_US/ksteamtrayicon.1 \
    "$pkgdir/usr/share/man/man1/ksteamtrayicon.1"
  gzip -f "$pkgdir/usr/share/man/man1/ksteamtrayicon.1"

  install -Dm644 man/pt_BR/ksteamtrayicon.1 \
    "$pkgdir/usr/share/man/pt_BR/man1/ksteamtrayicon.1"
  gzip -f "$pkgdir/usr/share/man/pt_BR/man1/ksteamtrayicon.1"
}
