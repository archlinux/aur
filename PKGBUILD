# Contributor: Gennadiy Chernyshyk <genaloner@gmail.com>
pkgname=deadbeef-plugin-headerbar-gtk3-git
pkgver=1.3.r0.ge8fe283
pkgrel=1
pkgdesc="Headerbar Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/saivert/ddb_misc_headerbar_GTK3"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL-2.0-only)
depends=(deadbeef gtk3 glib2 glibc)
makedepends=(git meson)
conflicts=(deadbeef-plugin-headerbar-gtk3)
provides=(deadbeef-plugin-headerbar-gtk3)

_gitname=ddb_misc_headerbar_GTK3
_gitroot=https://github.com/saivert/$_gitname

source=("git+$_gitroot")
md5sums=(SKIP)

pkgver() {
  git -C "$_gitname" describe --long --abbrev=7 --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  CFLAGS+=" -Wno-error=incompatible-pointer-types"
  CXXFLAGS+=" -Wno-error=incompatible-pointer-types"
  export CFLAGS
  export CXXFLAGS

  arch-meson $_gitname build
  meson compile -C build
}

package() {
  install -Dvm755 build/ddb_misc_headerbar_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_headerbar_GTK3.so
}
