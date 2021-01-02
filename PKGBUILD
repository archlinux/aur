# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=at-spi2-core-git
pkgver=2.38.0
pkgrel=1
pkgdesc="Protocol definitions and daemon for D-Bus at-spi"
url="https://gitlab.gnome.org/GNOME/at-spi2-core"
arch=(x86_64)
license=(GPL2)
depends=(dbus glib2 libxtst)
makedepends=(gobject-introspection git meson)
optdepends=('dbus-broker: Alternative bus implementation')
provides=(at-spi2-core)
conflicts=(at-spi2-core)
source=("git+https://gitlab.gnome.org/GNOME/at-spi2-core.git")
sha256sums=('SKIP')

pkgver() {
	  cd at-spi2-core
	    git describe --tags | sed 's/^AT_SPI2_CORE_//;s/_/./g;s/-/+/g'
}

prepare() {
	  cd at-spi2-core
}
 
build() {
	  arch-meson at-spi2-core build -D docs=false -D default_bus=dbus-broker 
	  
    meson compile -C build
}

#check() {
	  # memory test fails without desktop
	    # broker fails to launch without journald
#	      dbus-run-session meson test -C build --print-errorlogs || :
#      }

package() {
	  DESTDIR="$pkgdir" meson install -C build
  }

# vim:set ts=2 sw=2 et:

