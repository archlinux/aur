# Maintainer: Rikka <ayasa0520@gmail.com>
pkgname=waydroid-helper
pkgver=0.2.0
pkgrel=1
pkgdesc="A GUI application for Waydroid configuration and extension installation"
arch=('any')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL-3.0-or-later')
depends=('python' 'fakeroot' 'python-bidict' 'python-httpx' 'python-gobject>=3.50.0' 'python-yaml' 'python-pywayland' 'python-cairo' 'gtk4' 'libadwaita' 'python-aiofiles' 'python-dbus' 'android-tools')
makedepends=('git' 'python-setuptools' 'meson' 'ninja')
optdepends=('bindfs: shared folders support')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ffed545e0e60c929a9369eda4817ff6ea14bdf009f1551ab7bc0f474dd82816d')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --prefix /usr build
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
}
