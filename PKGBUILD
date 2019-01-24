# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-desktop-git
pkgver=3.31.4+1+g4501279a
pkgrel=1
epoch=1
pkgdesc="Library with common API for various GNOME modules"
url="https://gitlab.gnome.org/GNOME/gnome-desktop"
arch=(x86_64)
license=(GPL LGPL)
provides=(gnome-desktop)
conflicts=(gnome-desktop)
depends=(gsettings-desktop-schemas gtk3 libxkbfile xkeyboard-config iso-codes libseccomp bubblewrap)
makedepends=(gobject-introspection git autoconf-archive gtk-doc yelp-tools)
source=("git+https://gitlab.gnome.org/GNOME/gnome-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-desktop
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson gnome-desktop build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
