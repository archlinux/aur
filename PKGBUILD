# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell-git
_pkgname=ags
pkgver=v0.2.1.r10.g0a9e7e4
pkgrel=1
pkgdesc="aylur's gtk shell (ags),a eww inspired gtk widget system written in javascript"
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL3')
makedepends=('git' 'meson' 'npm')
depends=('glib2' 'libpulse' 'glibc' 'typescript' 'gjs' 'gtk3' 'gtk-layer-shell' 'gobject-introspection')
optdepends=('socat' 'gnome-bluetooth-3.0' 'upower' 'networkmanager')
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  git submodule update --init --recursive
}

build() {
  cd $srcdir/$_pkgname
  npm install
  meson setup build
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
