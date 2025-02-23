# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=libnotify-git
_pkgname=libnotify
pkgver=0.8.4.r0.570982f
pkgrel=1
pkgdesc="Library for sending desktop notifications"
arch=('i686' 'x86_64')
license=('LGPL-2.1-or-later')
url='https://gitlab.gnome.org/GNOME/libnotify'
depends=('gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc')
makedepends=('docbook-xsl' 'gi-docgen' 'git' 'glib2-devel' 'gobject-introspection' 'gtk3' 'meson' 'xmlto')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
