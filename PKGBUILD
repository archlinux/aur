# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Phillip Wood <phillip.wood@dunelm.org.uk>
pkgname='gnome-break-timer-git'
_pkgname=${pkgname%-git}
pkgver=3.1.0_6_gc13c273
pkgrel=2
epoch=
pkgdesc="The new typing break for GNOME, (replaces gnome-typing-break-bzr & drwright)"
arch=('x86_64' 'i686')
url='https://wiki.gnome.org/GnomeBreakTimer'
license=('GPL-3.0-or-later')
groups=()
depends=('glib2' 'gsound' 'glibc' 'hicolor-icon-theme' 'libadwaita' 'graphene' 'gtk4' 'cairo' 'json-glib' 'dconf' 'gcc-libs')
makedepends=('blueprint-compiler' 'git' 'meson' 'vala')
checkdepends=()
optdepends=()
provides=()
conflicts=('gnome-typing-break-bzr')
replaces=('gnome-typing-break-bzr')
backup=()
options=(!makeflags)
install="$pkgname.install"
changelog=
source=("git+https://gitlab.gnome.org/GNOME/gnome-break-timer.git"
        "$pkgname.install")
noextract=()
sha256sums=('SKIP'
            'b9f8bdaa058b458951112febd3210674a78cf8cbd1fa48ef6b166ccd55603da8') 
pkgver() {
  cd $srcdir/$_pkgname
  echo $(git describe | sed 's#-#_#g;s#v##')
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
