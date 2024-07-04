# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Phillip Wood <phillip.wood@dunelm.org.uk>
pkgname='gnome-break-timer-git'
_pkgname=${pkgname%-git}
pkgver=3.1.0_7_g472f2f1
pkgrel=1
epoch=
pkgdesc="A break timer application for GNOME."
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
changelog=
source=("git+https://gitlab.gnome.org/GNOME/gnome-break-timer.git")
noextract=()
sha256sums=('SKIP')
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
