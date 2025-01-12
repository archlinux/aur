# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver=90
pkgrel=1
_pkgver="Gtk4-${pkgver}"
pkgdesc="A Gtk4/libAdwaita fork from the desktop icons project, with several enhancements, better multimonitor support, GSConnect integration. For Gnome Shell 45, 46."
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding"
license=('GPL3')
depends=('gnome-shell' 'file-roller' 'nautilus')
makedepends=('git' 'meson' 'glib2')
conflicts=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")
provides=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")

_commit=e52ec334015e09b4a5401713828ebdf011fbc0a0 # tags/Gtk4-90
source=("git+https://gitlab.com/smedius/desktop-icons-ng.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/desktop-icons-ng"
  git describe --tags | sed 's/Gtk4-//;s/-/+/g'
}

build() {
  arch-meson desktop-icons-ng build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
