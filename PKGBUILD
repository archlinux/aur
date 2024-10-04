# Packager: teraflops cprieto.ortiz@gmail.com

pkgname=gnome-monitor-config-git
pkgver=04b854e
pkgrel=1
pkgdesc="GNOME monitor configuration utility"
arch=('x86_64')
url="https://github.com/jadahl/gnome-monitor-config"
license=('GPL3')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'pkg-config' 'gobject-introspection')
provides=('gnome-monitor-config')
conflicts=('gnome-monitor-config')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Generates a version number like: 1.0.r123.gabcdef
  git describe --tags --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  meson setup build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}

