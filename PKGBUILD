# Maintainer:  Luo Yi <langisme_at_qq_dot_com>

pkgname="terminal-gtk4-git"
pkgver=v42.alpha2.r12.g00a7a5a
pkgrel=1
pkgdesc="A beautiful and simple GTK 4 terminal."
license=("GPL3")
arch=("any")
url="https://gitlab.gnome.org/raggesilver/terminal"
depends=(gtk4 glib2 libadwaita marble-gtk4-git vte4-git json-glib pcre2)
makedepends=(git meson vala)
source=("$pkgname::git+https://gitlab.gnome.org/raggesilver/terminal"
        launch_fix.diff)
sha256sums=('SKIP'
            '6d675227f2e2217e823a12638c9a08eb2d35f25416dd47656135132eddef956c')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p1 < $srcdir/launch_fix.diff
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
