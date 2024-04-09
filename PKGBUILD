# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=wayfarer
pkgver=1.2.4
pkgrel=1
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection' 'blueprint-compiler')
depends=('gtk4' 'libpulse')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3ce196192b0a7dd05771051c85e9aa78f2f36a21a0d905ebf9fd4b5cd6e11811')

build() {
  cd $pkgname-$pkgver
  meson setup build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C build
}
