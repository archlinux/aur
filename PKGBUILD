# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase=gplugin
pkgname="$_pkgbase-hg"
pkgver=993.307728b2f727
pkgrel=1
pkgdesc="GObject based library that implements a reusable plugin system"
arch=('i686' 'x86_64' 'armv7h')
url="https://guifications.org/"
license=('GPL')
depends=('glib2' 'gobject-introspection-runtime')
makedepends=('mercurial' 'cmake' 'gobject-introspection' 'gtk3'
             'python-gobject' 'lua-lgi' 'libxslt' 'help2man')
optdepends=('gtk3: for GTK+ support'
            'python-gobject: for Python support'
            'lua-lgi: for Lua support')
provides=("$_pkgbase=0.0.23")
conflicts=("$_pkgbase")
source=("$_pkgbase::hg+https://bitbucket.org/gplugin/main#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"

  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

prepare() {
  mkdir -p "$srcdir/$_pkgbase/build"
  cd "$srcdir/$_pkgbase/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "$srcdir/$_pkgbase/build"
  make
}

package() {
  cd "$srcdir/$_pkgbase/build"
  make DESTDIR="$pkgdir/" install
}
