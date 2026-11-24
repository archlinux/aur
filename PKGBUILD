# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
pkgname=oled-care
pkgver=2026.11.24.1
pkgrel=1
pkgdesc='HDMI-safe OLED blanker for KDE/Wayland — black screens without killing your AVR'
arch=('any')
url='https://github.com/JochemKuipers/oled-care'
license=('MIT')
depends=('python' 'pyside6' 'python-pywayland')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be9dce7e7e99b378f988ee185427d4956780352d9d14068bcdf7fe272d7bd21c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 resources/oled-care.desktop \
    "$pkgdir/usr/share/applications/oled-care.desktop"
  install -Dm644 resources/oled-care.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/oled-care.svg"
}
