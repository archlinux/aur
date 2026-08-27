# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver=100.28
pkgrel=1
_pkgver="Gtk4-${pkgver}"
pkgdesc="GTK4 desktop icons extension fork for GNOME Shell 49, 50, with Desktop Widget support"
arch=('any')
url="https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding"
license=('GPL3')
depends=('gnome-shell' 'nautilus')
makedepends=('git' 'meson')
optdepends=(
  'file-roller: Work with compressed files'
  'webkitgtk-6.0: HTML widget support'
  'libgtop: System monitor widget support'
)

conflicts=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")
provides=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")

_commit=79e826e7c3f94892dbec0561195afc420a3f9fe3 # tags/100.28
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
