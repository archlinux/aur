### Maintainer:Magillos <your.email@example.com>

pkgname=cable
pkgver=0.5.1
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

sha256sums=('3e08f8d421e44174589b2052f951d72d03219260a12e3c04c010837f44abd77e'
            '7f93291e51877e6b8a48eb72debac64f9e13c0a91495726164eda143820f3579'
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
