# Maintainer: Campbell Jones <arch at serebit dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=budgie-screensaver
pkgver=5.1.0
pkgrel=4
pkgdesc='Screensaver for the Budgie Desktop'
arch=(x86_64)
url='https://github.com/BuddiesOfBudgie/budgie-screensaver'
license=(GPL-2.0-only)
groups=(budgie)
depends=(
  cairo
  dbus
  dbus-glib
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop
  gtk3
  libx11
  libxxf86vm
  pam
  systemd-libs
)
makedepends=(
  git
  glib2-devel
  intltool
  meson
)
backup=(etc/pam.d/budgie-screensaver)
source=("git+https://github.com/BuddiesOfBudgie/budgie-screensaver.git?signed#tag=v$pkgver")
b2sums=(dc9fa180fae291c72ac41ffac01700bc2d3f65e6f5f2b1066a2a978fa53144d7fb0ff83ff393ba7ea29fbe8e32ca5b914666cd267ac79dea4791538840c902dd)
validpgpkeys=(
  0E0D97562A4EC8BD8E329DCDAA7A2325E04B609B # Joshua Strobl <me@joshuastrobl.com>
  8A59B135826B2DA453B9707408AD7343E6BD4B56 # Campbell Jones <git@serebit.com>
)

prepare() {
  cd $pkgname

  # Remove unused dependency
  sed -i '/dep_gnomekbdui/d' {,src/}meson.build
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
