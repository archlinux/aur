# Submitter: Yosef Or Boczko <yoseforb@gnome.org>
# Maintainer: emersion <contact@emersion.fr>

_pkgname=gnome-music
pkgname=$_pkgname-git
pkgver=3.17.4.r22.gfb9c664
pkgrel=1
pkgdesc="Music player and management application for GNOME"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Music"
license=('GPL')
depends=('gtk3>=3.13.2' 'glib2' 'python-dbus' 'python-gobject' 'python-requests' 'tracker' 'grilo'
         'libmediaart' 'grilo-plugins' 'python-dbus-common' 'gupnp' 'gupnp-av' 'libdmapsharing' 'gssdp'
         'yelp-tools')
makedepends=('git' 'intltool' 'gobject-introspection' 'gnome-common')
provides=('gnome-music=3.17.4')
conflicts=('gnome-music')
install=gnome-music.install
source=("git://git.gnome.org/gnome-music")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^MUSIC_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git clone git://git.gnome.org/libgd
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
