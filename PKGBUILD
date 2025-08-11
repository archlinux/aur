# Packager: teraflops cprieto.ortiz@gmail.com

pkgname=gnome-monitor-config-git
pkgver=0
pkgrel=1
pkgdesc="GNOME monitor configuration utility"
arch=('x86_64')
url="https://github.com/jadahl/gnome-monitor-config"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'mutter')
makedepends=('git' 'meson' 'ninja' 'pkg-config' 'gobject-introspection' 'glib2-devel')
provides=('gnome-monitor-config')
conflicts=('gnome-monitor-config')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  meson build
  cd build
  meson compile
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/src/gnome-monitor-config "$pkgdir/usr/bin/gnome-monitor-config"
}


