# Maintainer: Magillos <kerown at gmail dot com>

pkgname=cable
pkgver=0.5
pkgrel=1
pkgdesc="A PyQt6 application to dynamically modify Pipewire and Wireplumber settings"
arch=('any')
url="https://github.com/magillos/Cable"
license=('GPL-3.0')
depends=('python' 'python-pyqt6' 'python-jack-client')
makedepends=('python-setuptools')
source=(
  "Cable.py::https://raw.githubusercontent.com/magillos/Cable/master/Cable.py"
  "setup.py::https://raw.githubusercontent.com/magillos/Cable/master/setup.py"
  "jack-plug.svg::https://raw.githubusercontent.com/magillos/Cable/master/jack-plug.svg"
  "local.cable.Cable.desktop::https://raw.githubusercontent.com/magillos/Cable/master/local.cable.Cable.desktop"
  "connection-manager.py::https://raw.githubusercontent.com/magillos/Cable/master/connection-manager.py"
)

sha256sums=('98fc4001a4d4c1e5245713b01bc2c700b5557eb614088c415b727494b0be64c5'
            'b0bcfdc376e298835203b0c09c3d5d85b81a484e3b8927fae3cf75b63ae3997d'
            '5c3fa8b496c1a4a1918a2bfa2420cfa3ceedc93307d566a55c8f0835f3b33442'
            '8cff61b117863f5dee1f918cd28c15245c696fdb5a289c0b8b3afe8a3d11c22f'
            '285eaa62e49b4a08bc1927202114dadf5a3d5bb178b49ad85b46308155d180f6')


build() {
  cd "$srcdir"
  python setup.py build
}

package() {
  cd "$srcdir"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Install the icon
  install -Dm644 "$srcdir/jack-plug.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/jack-plug.svg"

  # Install the desktop entry
  install -Dm644 "$srcdir/local.cable.Cable.desktop" "$pkgdir/usr/share/applications/local.cable.Cable.desktop"

  # Create the /usr/share/cable directory if it doesn't exist
  install -d "$pkgdir/usr/share/cable"

  # Install connection-manager.py to /usr/share/cable
  install -D "$srcdir/connection-manager.py" "$pkgdir/usr/share/cable/connection-manager.py"
}
