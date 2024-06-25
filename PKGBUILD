# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings-git
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
pkgver=4.3.r17.g4949544
pkgrel=1
arch=(any)
license=(AGPL-3.0-or-later)
depends=(gdm libadwaita glib2-devel python-gobject gettext polkit)
makedepends=(git meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
provides=(gdm-settings)
conflicts=(gdm-settings)
source=("$pkgname"::"git+https://github.com/gdm-settings/gdm-settings.git")
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
   arch-meson "$srcdir/$pkgname" build
   meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
