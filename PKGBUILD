# Maintainer: LordDemecrius83 <lorddemecrius83@proton.me>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libwnck3-336
pkgver=3.36.0
pkgrel=1
pkgdesc="Library to manage X windows and workspaces (via pagers, tasklists, etc.) 3.36 version (Workaround for https://github.com/mate-desktop/mate-panel/issues/1230)"
url="https://gitlab.gnome.org/GNOME/libwnck"
arch=(x86_64)
license=(LGPL)
provides=(libwnck3)
conflicts=(libwnck3)
depends=(gtk3 startup-notification libxres)
makedepends=(gobject-introspection gtk-doc git meson)
options=(debug)
_commit=3c469a0d7e58e36106eea7600ae2f6fd8aaed232  # tags/3.36.0^0
source=("git+https://gitlab.gnome.org/GNOME/libwnck.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd libwnck
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libwnck
}

build() {
  arch-meson libwnck build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
