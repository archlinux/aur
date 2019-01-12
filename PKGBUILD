# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=eog-git
pkgver=3.31.3+1+ga78d3b5b
pkgrel=1
pkgdesc="Eye of Gnome: An image viewing and cataloging program"
url="https://wiki.gnome.org/Apps/EyeOfGnome"
arch=(x86_64)
license=(GPL)
provides=(eog)
conflicts=(eog)
depends=(gnome-desktop libexif lcms2 exempi libpeas librsvg dconf)
makedepends=(intltool itstool gobject-introspection gtk-doc gnome-common git meson)
optdepends=('eog-plugins: Additional features')
groups=(gnome)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/eog.git")
sha256sums=('SKIP')

pkgver() {
  cd eog
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson eog build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
