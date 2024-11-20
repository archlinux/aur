# Maintainer: Rikka <ayasa0520@gmail.com>
pkgname=waydroid-helper
pkgver=0.1.2
pkgrel=1
pkgdesc="A GUI application for Waydroid configuration and extension installation"
arch=('any')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL-3.0-or-later')
depends=('python' 'fakeroot' 'python-bidict' 'python-httpx' 'python-gobject>=3.50.0' 'python-yaml' 'python-pywayland' 'python-cairo' 'gtk4' 'libadwaita' 'python-aiofiles' 'python-dbus')
makedepends=('git' 'python-setuptools' 'meson' 'ninja')
optdepends=('bindfs: shared folders support')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7cc84d55f1308134c34e82dc104cc7148ad37975532c5e5c180571b45c41de5f')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --prefix /usr build
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
}
