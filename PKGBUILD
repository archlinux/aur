# Maintainer:  <zhaose@Planet>
pkgname=guile-gi-git
pkgver=1223.ea5d051
pkgrel=1
pkgdesc="Bindings for GObject Introspection and libgirepository for Guile"
arch=('x86_64')
url="https://github.com/spk121/guile-gi"
license=('GPL3')
depends=('guile' 'gobject-introspection-runtime')
makedepends=('git' 'gobject-introspection')
source=("${pkgname}::git+https://github.com/spk121/guile-gi.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  ./bootstrap

  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"

  make -k check || :
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
