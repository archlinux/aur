# Maintainer: LuoYi <langisme_dot_qq_com>

pkgname="marble-gtk4-git"
pkgver=v1.3.0.r4.g6dcc6fe
pkgrel=1
pkgdesc="A collection of useful functions and reusable widget for GTK (wip/gtk4)"
license=("GPL3")
arch=("any")
url="https://gitlab.com/raggesilver/marble"
depends=(gtk4 glib2)
makedepends=(git meson vala)
provides=(marble-gtk4)
conflicts=(marble-gtk marble-gtk-git)
source=("$pkgname::git+https://gitlab.com/raggesilver/marble.git#branch=wip/gtk4")
sha256sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build -D tests=false
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}