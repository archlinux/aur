# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=wayfarer
pkgver=1.1.0
pkgrel=2
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection' 'blueprint-compiler')
depends=('gtk4' 'libpulse')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a787b7a6c171f60d55d2fe71b6f874e275c0ac88e5c6768da1809f1e43de8daa')

build() {
  cd $pkgname-$pkgver
  meson setup build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C build
}
