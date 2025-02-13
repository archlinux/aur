# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.19.3
pkgrel=1
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
source=("git+https://github.com/flatpak/xdg-desktop-portal?signed#tag=$pkgver")
b2sums=('563d92de5960414742c90c5dd8c992761e24ed58264eebe69d6aafcb95253a108157c214fe042ee136327a6ea26455507ef36d98d4b7399b944e3c6ebfb1e76b')
validpgpkeys=(
  9038F70CA72FAC9D10C6327B89AFE307C861D158 # Georges Basile Stavracas Neto (Primary Key) <georges.stavracas@gmail.com>
)

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  # https://github.com/flatpak/xdg-desktop-portal/issues/1589
  XDP_VALIDATE_ICON_INSECURE=1 XDP_VALIDATE_SOUND_INSECURE=1 \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
