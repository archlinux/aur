# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=atomix
pkgname=$_pkgname-git
pkgver=3.34.0.r11.gbfe0acc
pkgrel=1
pkgdesc="Build molecules out of single atoms"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(gtk3 libgnome-games-support)
makedepends=(meson appstream-glib git)
conflicts=('gnome-games' "${_pkgname}")
replaces=('gnome-games' "${_pkgname}")
provides=("${_pkgname}=$pkgver")
options=('!emptydirs' '!libtool')
url="https://wiki.gnome.org/Apps/Atomix"
groups=('gnome-extra')
source=('git+https://gitlab.gnome.org/GNOME/atomix.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^ATOMIX_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
