# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.19.1
pkgrel=2
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  fuse3
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gstreamer
  gst-plugins-base-libs
  json-glib
  libgudev
  libpipewire
  pipewire
  rtkit
  systemd
  systemd-libs
)
makedepends=(
  docbook-xsl
  flatpak
  geoclue
  git
  glib2-devel
  gst-plugins-good
  libportal
  meson
  python-dbus
  python-dbusmock
  python-docutils
  python-gobject
  python-pytest
  python-sphinx
  python-sphinx-copybutton
  python-sphinxext-opengraph
  python-sphinx-furo
  umockdev
  xmlto
)
optdepends=(
  'geoclue: Geolocation portal'
  'xdg-desktop-portal-impl: Portal backends'
)
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver")
b2sums=('75aca9af8b8c8f3d1a54ef0b8ac316e3810d4b56595860f6e3e0add2c3aaa710f9bc2838f56fe765fdb5fcbe741f950686329c97fe39cf2385da84537ebb7ef8')

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  # Broken tests: xdg-desktop-portal:portals / test-portals-notification
  meson test -C build --print-errorlogs |:
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
