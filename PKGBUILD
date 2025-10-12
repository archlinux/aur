# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=wayfarer
pkgver=1.4.0
pkgrel=1
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection' 'blueprint-compiler')
depends=('gtk4' 'libpulse')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('b378891d4bb9ffd523de77f476c211fcddac3e5ccd5e11e24988b0c88cfaf2c8')

build() {
  cd $pkgname-$pkgver
  meson setup build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C build
}
