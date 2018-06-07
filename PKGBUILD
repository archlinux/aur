# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Tim Jester-Pfadt <t.jp<at>gmx.de>

_pkgname=gnome-builder
pkgname=gnome-builder-git
pkgver=3.29.2+40+gd16771663
pkgrel=1
pkgdesc='An IDE for writing GNOME-based software'
arch=(i686 x86_64)
url='https://wiki.gnome.org/Apps/Builder'
license=(GPL3)
conflicts=(gnome-builder)
provides=(gnome-builder)
depends=(gtksourceview3 devhelp libgit2-glib gjs python-gobject clang desktop-file-utils
         ctags libpeas vte3 vala python-jedi autoconf-archive sysprof flatpak gspell libdazzle-git
         template-glib jsonrpc-glib-git python-sphinx)
makedepends=(intltool llvm gobject-introspection gtk-doc yelp-tools appstream-glib vala git
             mm-common meson)
optdepends=('gnome-code-assistance: Legacy assistance services'
            'meson: Meson support')
install=gnome-builder.install
source=('git+git://git.gnome.org/gnome-builder')
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^GNOME_BUILDER_//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson ${_pkgname} build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=2 sw=2 et:

