# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.18.3
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  fuse3
  gcc-libs
  gdk-pixbuf2
  geoclue
  glib2
  glibc
  json-glib
  libpipewire
  pipewire
  rtkit
  systemd
  systemd-libs
)
makedepends=(
  docbook-xsl
  flatpak
  git
  libportal
  meson
  python-dbus
  python-dbusmock
  python-docutils
  python-gobject
  python-pytest
  xmlto
)
optdepends=('xdg-desktop-portal-impl: Portal backends')
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver")
b2sums=('a364e84b05f70c165a87d43c964438df4c70395c6d0364e5aaae2fed7b29a1cfd180b2d7339a20ad1220fc6bd9792bd347ff270f1c0f055caabda79be31dad7f')

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
