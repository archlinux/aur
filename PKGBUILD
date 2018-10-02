# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase=gplugin
pkgname="$_pkgbase-hg"
pkgver=1251.14d65225b360
pkgrel=1
pkgdesc="GObject based library that implements a reusable plugin system"
arch=('i686' 'x86_64' 'armv7h')
url="https://bitbucket.org/gplugin/gplugin"
license=('GPL')
depends=('glib2' 'gobject-introspection-runtime')
makedepends=('mercurial' 'cmake' 'gobject-introspection' 'gtk3'
             'python-gobject' 'lua-lgi' 'libxslt' 'help2man')
optdepends=('gtk3: for GTK+ support'
            'python-gobject: for Python support'
            'lua-lgi: for Lua support')
provides=("$_pkgbase=0.0.23")
conflicts=("$_pkgbase")
source=("$_pkgbase::hg+https://bitbucket.org/gplugin/gplugin#branch=develop")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "$srcdir/$_pkgbase"

  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

prepare() {
  cd $_pkgbase
  meson build \
    --prefix=/usr \
    --buildtype=release
}

build() {
  cd $_pkgbase
  ninja -C build
}

package() {
  cd $_pkgbase
  DESTDIR="$pkgdir" ninja -C build install
}
