# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=cambalache
pkgver=0.96.0
pkgrel=1
pkgdesc="A new RAD tool for Gtk 4 and 3"
arch=('x86_64')
url="https://gitlab.gnome.org/jpu/cambalache"
license=('LGPL-2.1-only')
depends=('at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk3' 'gtk4'
         'gtksourceview5' 'harfbuzz' 'hicolor-icon-theme' 'libadwaita' 'libhandy'
         'libxkbcommon' 'pango' 'pixman' 'python' 'python-gobject' 'python-lxml'
         'wayland' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'wlroots>=0.18.0')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'wayland-protocols')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('015460c2c2419f71dffa5fb92ad12a44dd55087c32a4d9f664847af610d7e1d2bb7b5e7da97c069ec7e33cf2a41d5d5463614b167156ad64e81a1d5899591768')

prepare() {
  # Use project's Casilda dependency
  # (This is likely the best solution until other programs start to use it)
  meson subprojects download casilda --sourcedir="${pkgname}-${pkgver}"
  meson subprojects update casilda --sourcedir="${pkgname}-${pkgver}"
}

build() {
  arch-meson "${pkgname}-${pkgver}" build --reconfigure

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
