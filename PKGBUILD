# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=screen-orientation-manager-git
_pkgname=screen-orientation-manager
pkgver=v1.3.1
pkgrel=2
pkgdesc="This app rotates the touchscreen, display and touchpad orientation of convertible laptops and tablets running X11 based desktop environments."
arch=('any')
url="https://github.com/archisman-panigrahi/surface-RT-screen-rotator"
provides=($_pkgname)
conflicts=($_pkgname)
license=('GPL-3.0-or-later')
depends=('gtk3' 'python' 'libayatana-appindicator')
makedepends=('git' 'meson' 'ninja')
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/surface-RT-screen-rotator"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/surface-RT-screen-rotator"
  DESTDIR="$pkgdir" meson install -C build
}
