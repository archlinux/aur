# Maintainer:Magillos <kerown at gmail com>

pkgname=cable
pkgver=0.5.1.2
pkgrel=1
pkgdesc="A PyQt6 application to dynamically modify Pipewire and Wireplumber settings"
arch=('any')
url="https://github.com/magillos/Cable"
license=('GPL-3.0')
depends=('python' 'python-pyqt6' 'python-jack-client')
makedepends=('python-setuptools')
source=("cable-$pkgver.tar.gz::https://github.com/magillos/Cable/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('bbe0727cb7ad875cff4d4f659d51c6173dc6105bb054b490b6a28436ad8a684c')




build() {
  cd "$srcdir/Cable-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Cable-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Install the icon
  install -Dm644 "jack-plug.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/jack-plug.svg"

  # Install the desktop entry
  install -Dm644 "local.cable.Cable.desktop" "$pkgdir/usr/share/applications/local.cable.Cable.desktop"

  # Create the /usr/share/cable directory if it doesn't exist
  install -d "$pkgdir/usr/share/cable"

  # Install connection-manager.py to /usr/share/cable
  install -D "connection-manager.py" "$pkgdir/usr/share/cable/connection-manager.py"
}
