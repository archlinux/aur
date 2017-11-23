# Maintainer: Gennadiy Chernyshyk <genaloner@gmail.com>
pkgname=deadbeef-plugin-headerbar-gtk3-git
pkgver=r102
pkgrel=1
pkgdesc="Headerbar Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/saivert/ddb_misc_headerbar_GTK3"
arch=("i686" "x86_64")
license=("GPL2")

_gitname=ddb_misc_headerbar_GTK3
_gitroot=https://github.com/saivert/${_gitname}

source=("git+$_gitroot")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r""$(git rev-list --count HEAD)"
}


build() {
  cd $_gitname

  touch AUTHORS
  touch ChangeLog

  ./autogen.sh
  ./configure
  make
}

package() {
  depends=("deadbeef" "gtk3")
  conflicts=("deadbeef-plugin-headerbar-gtk3")
  provides=("deadbeef-plugin-headerbar-gtk3")
  install -D -v -c $srcdir/$_gitname/src/.libs/ddb_misc_headerbar_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_headerbar_GTK3.so
}

