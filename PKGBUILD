# Maintainer:  Luo Yi <langisme_at_qq_dot_com>

pkgname="terminal-gtk4-git"
pkgver=v42.alpha2
pkgrel=1
pkgdesc="A beautiful and simple GTK 4 terminal."
license=("GPL3")
arch=("any")
url="https://gitlab.gnome.org/raggesilver/terminal"
depends=(gtk4 glib2 libadwaita marble-gtk4-git vte4-git json-glib pcre2)
makedepends=(git meson vala)
source=("$pkgname::git+https://gitlab.gnome.org/raggesilver/terminal"
        build_fix.diff)
sha256sums=('SKIP'
            '0db5209d9b7238c7a805992f1c392070cf54237fddf1df872d9e5ac3902c1d59')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p1 < $srcdir/build_fix.diff
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
