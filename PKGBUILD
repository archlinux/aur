# Maintainer: Darryl Pogue <darryl@dpogue.ca>

pkgname="gplugin"
pkgver=0.29.0
pkgrel=1
arch=('i868' 'x86_64')
pkgdesc="A GObject based library that implements a reusable plugin system"
license=("LGPL2")
url="https://bitbucket.org/gplugin/gplugin"
depends=("gtk3")
makedepends=("meson"
             "mercurial"
             "gcc"
             "gobject-introspection"
             "pkg-config"
             "help2man"
             "gettext")
options=('strip' '!debug' 'staticlibs')
source=("$pkgname::hg+https://bitbucket.org/$pkgname/$pkgname#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  meson --prefix /usr --buildtype=plain -D doc=false -D perl=false -D python=false -D lua=false -D tcl=false "$srcdir/$pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
