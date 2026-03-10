# Maintainer: Your Name <your.email@example.com>

pkgname=usb-link-speed-tray-git
pkgver=0.1.3
pkgrel=1
pkgdesc="Tray app showing link speed of attached USB storage (e.g. 480 Mbps vs 5 Gbps) and mount points"
arch=('any')
url="https://github.com/Gunther-Schulz/usb-link-speed-tray"
license=('MIT')
depends=('python>=3.10' 'python-pillow' 'python-gobject' 'python-cairosvg' 'libappindicator-gtk3' 'gtk3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('5dad237d4e0f23bde46c0d9688fcb61ed99d15a12868d25a9744f752f2720926')

build() {
  cd "$srcdir/usb-link-speed-tray-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/usb-link-speed-tray-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  if [ -f LICENSE ]; then install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"; fi
  install -Dm644 desktop/usb-link-speed-tray.desktop "$pkgdir/usr/share/applications/usb-link-speed-tray.desktop"
  install -Dm644 desktop/usb-link-speed-tray.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/usb-link-speed-tray.svg"
}
