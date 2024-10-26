# Maintainer: Rikka <ayasa0520@gmail.com>
pkgname=waydroid-helper
pkgver=0.1.1
pkgrel=1
pkgdesc="A GUI application for Waydroid configuration and extension installation"
arch=('any')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL')
depends=('python' 'fakeroot' 'python-bidict' 'python-httpx' 'python-gobject>=3.50.0' 'python-yaml' 'python-pywayland' 'python-cairo' 'gtk4' 'libadwaita' 'python-aiofiles')
makedepends=('git' 'python-setuptools' 'meson' 'ninja')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('740e68417459167aec734b60e9840e51b1bf5517eb7a8e69c4502afd28bc5433')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --prefix /usr build
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
}
