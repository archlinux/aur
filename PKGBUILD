# Maintainer: Rikka <ayasa0520@gmail.com>
pkgname=waydroid-helper
pkgver=r30.072b2fe
pkgrel=1
pkgdesc="A GUI application for Waydroid configuration and extension installation"
arch=('any')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL')
depends=('python' 'python-bidict' 'python-httpx' 'python-gobject>=3.50.0' 'python-yaml' 'python-pywayland' 'python-cairo' 'gtk4' 'libadwaita' 'python-aiofiles')
makedepends=('git' 'python-setuptools' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  meson setup --prefix /usr build
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir" ninja -C build install
}
