# Maintainer:Magillos <kerown at gmail com>

pkgname=cable
pkgver=0.10.0
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
  sha256sums=('aad98f8c4e926ea47537f7bbb55ec87ddf81cbe209ebcd02386bd73c661caff3')
fi

build() {
  cd "$srcdir/Cable-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/Cable-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl


  install -Dm644 "jack-plug.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/jack-plug.svg"
  install -Dm644 "com.github.magillos.cable.desktop" "$pkgdir/usr/share/applications/com.github.magillos.cable.desktop"
  install -Dm755 "connection-manager.py" "$pkgdir/usr/share/cable/connection-manager.py"

}
