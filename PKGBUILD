# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver=gtk4+100.11
pkgrel=1
_pkgver="Gtk4-${pkgver}"
pkgdesc="A Gtk4/libAdwaita fork from the desktop icons project, with several enhancements, better multimonitor support, GSConnect integration. For Gnome Shell 47, 48, 49"
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding"
license=('GPL3')
depends=('gnome-shell' 'file-roller' 'nautilus')
makedepends=('git' 'meson' 'glib2')
conflicts=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")
provides=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")

_commit=ff5b909426737f64989acc3e39bdd540f8dfb2b3 # tags/Gtk4-100.11
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
