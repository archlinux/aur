# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=cambalache
pkgver=0.94.1
pkgrel=2
pkgdesc="A new RAD tool for Gtk 4 and 3"
arch=('x86_64')
url="https://gitlab.gnome.org/jpu/cambalache"
license=('LGPL-2.1-only')
depends=('at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gtk4'
         'gtksourceview5' 'hicolor-icon-theme' 'libadwaita' 'libhandy'
         'libxkbcommon' 'pango' 'pixman' 'python' 'python-gobject' 'python-lxml'
         'wayland' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'wlroots>=0.18.0')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'wayland-protocols')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('201179d2fbbaba508e7f5ef1aa0436463fcb00ebbd2a989bee8b19d31eef69bcf4fedeafe8a85cbacd4c8dcf0b8a89494513cd5cf44f0ee2fdc926d8ae4906e9')

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
