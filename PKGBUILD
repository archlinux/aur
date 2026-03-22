# Maintainer:Magillos <kerown at gmail com>

pkgname=cable
pkgver=0.10.3
pkgrel=1
pkgdesc="A PyQt6 application to dynamically modify Pipewire and Wireplumber settings"
arch=('any')
url="https://github.com/magillos/Cable"
license=('GPL-3.0')
depends=('python' 'python-pyqt6' 'python-jack-client' 'jack_delay' 'python-requests' 'python-pyalsaaudio' 'python-packaging' 'aj-snapshot' 'pipewire-jack' 'python-dbus' 'hicolor-icon-theme' 'python-graphviz')
makedepends=('python-build' 'python-installer' 'python-setuptools')

if [ -n "${USE_LOCAL}" ]; then
  source=("${USE_LOCAL_PATH:-./Cable-$pkgver.tar.gz}")
  sha256sums=('SKIP')
else
  source=("cable-$pkgver.tar.gz::https://github.com/magillos/Cable/archive/refs/tags/$pkgver.tar.gz")
  sha256sums=('5af3764a4fa59158c2e57dbd9312532ee3976f5e7e504a5c5ceea7b9c1327f66')
fi

build() {
  cd "$srcdir/Cable-$pkgver"
   rm -rf dist/
  python -m build
}

package() {
  cd "$srcdir/Cable-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl


  install -Dm644 "jack-plug.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/jack-plug.svg"
  install -Dm644 "com.github.magillos.cable.desktop" "$pkgdir/usr/share/applications/com.github.magillos.cable.desktop"
  install -Dm755 "connection-manager.py" "$pkgdir/usr/share/cable/connection-manager.py"

}
