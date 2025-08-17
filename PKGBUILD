# Maintainer: Rikka <ayasa0520@gmail.com>
pkgname=waydroid-helper
pkgver=0.2.3
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
sha256sums=('b7bc598eba32856e050f2b469af31c29930c93564435fd4b294dc18c43f4d70f')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --prefix /usr build
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
}
