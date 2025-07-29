# Maintainer: Rikka <ayasa0520@gmail.com>
_pkgname="waydroid-helper"
pkgname="waydroid-helper-git"
pkgver=r66.5279fe3
pkgrel=1
pkgdesc="A GUI application for Waydroid configuration and extension installation"
arch=('any')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL-3.0-or-later')
depends=('python' 'fakeroot' 'python-bidict' 'python-httpx' 'python-gobject>=3.50.0' 'python-yaml' 'python-pywayland' 'python-cairo' 'gtk4' 'libadwaita' 'python-aiofiles' 'python-dbus' 'android-tools')
makedepends=('git' 'python-setuptools' 'meson' 'ninja')
optdepends=('bindfs: shared folders support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname%-git}"
  meson setup --prefix /usr build
  ninja -C build
}

package() {
  cd "$srcdir/${_pkgname%-git}"
  DESTDIR="$pkgdir" ninja -C build install
}
