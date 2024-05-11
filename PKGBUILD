# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Princeton Ferro (prince781) <princetonferro[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=cambalache
pkgname=cambalache-git
pkgver=0.90.2.r7.gad89e6b
pkgrel=1
pkgdesc="A new RAD tool for Gtk 4 and 3 (Git version)"
url="https://gitlab.gnome.org/jpu/cambalache"
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('glib2' 'gtk3' 'gtk4' 'gtksourceview5' 'libadwaita' 'libhandy' 'python-gobject'
         'python-lxml' 'webkit2gtk-4.1' 'webkitgtk-6.0')
depends+=('wlroots-git') # TODO: Switch to regular wlroots when 0.18.0 gets released
makedepends=('git' 'meson' 'ninja')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
