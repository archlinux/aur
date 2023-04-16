# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings-git
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
pkgver=3.1+6+g4f71fd0
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(git meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
provides=(gdm-settings)
conflicts=(gdm-settings)
source=("$pkgname"::"git+https://github.com/gdm-settings/gdm-settings.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed -e 's/^v//' -e 's/-/+/g'
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
