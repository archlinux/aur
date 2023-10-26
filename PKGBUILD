# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.18.1
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64)
license=(LGPL)
depends=(
  fuse3
  gdk-pixbuf2
  geoclue
  glib2
  pipewire
  rtkit
  systemd
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
_commit=37a6f7c8b8e08b9861f05e172cd4e0d07a832c4d  # tags/1.18.1
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

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
