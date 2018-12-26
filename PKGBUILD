# Maintainer: Darryl Pogue <darryl@dpogue.ca>

pkgname="gplugin"
pkgver=0.27
pkgrel=2
arch=('i868' 'x86_64')
pkgdesc="A GObject based library that implements a reusable plugin system"
license=("LGPL 2")
url="https://bitbucket.org/gplugin/gplugin"
depends=("gtk3")
makedepends=("cmake"
             "gcc"
             "gobject-introspection"
             "pkg-config"
             "help2man"
             "gettext")
options=('strip' '!debug' 'staticlibs')
source=("$pkgname::hg+https://bitbucket.org/$pkgname/main#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build

  cmake "$srcdir/$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DBUILD_LUA="Off" \
    -DBUILD_PYTHON="Off" \
    -DTESTING_ENABLED="Off"

  make
}

package() {
  cd "$srcdir/$pkgname"
  cd build
  make DESTDIR="$pkgdir" install
}
