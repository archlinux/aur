# Maintainer: Tim Jester-Pfadt <t.jp<at>gmx.de>

pkgname=gnome-builder-git
pkgver=2657.cac6cfe
pkgrel=4
pkgdesc="Builder, a new IDE for Gnome"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Builder"
license=(GPL)
conflicts=(gnome-builder)
depends=('gtksourceview3-git' 'gtk3-git' 'libpeas-git' 'gsettings-desktop-schemas' 'dconf' 'devhelp' 'glade' 'webkit2gtk' 'gtk-doc' 'clang' 'gjs' 
'libgit2-glib-git' 'glib2-git')
makedepends=('gnome-common-git' 'gobject-introspection-git' 'llvm' 'intltool')
install=gnome-builder.install
source=('git+git://git.gnome.org/gnome-builder')
sha256sums=('SKIP')

build() {
  cd "$srcdir"/gnome-builder
  #autoreconf -fi
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-rdtscp --disable-schemas-compile
  make
}

package() {
  cd "$srcdir"/gnome-builder
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir"/gnome-builder
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
