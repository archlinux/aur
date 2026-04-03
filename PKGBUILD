# Maintainer: Natounlars <198830487@qq.com>

pkgname=cpdb-backend-cups-git
pkgver=2.0b7.r21.g56a1596
pkgrel=1
pkgdesc="Common Print Dialog Backends - CUPS/IPP backend"
arch=('x86_64')
url="https://openprinting.github.io/"
license=('GPL2' 'GPL3')
depends=(
    'cpdb-libs'
    'libcups'
    'libcupsfilters'
    'glib2'
)
makedepends=(
    'git'
    'autoconf'
    'automake'
    'libtool'
    'pkg-config'
    'gettext'
)
provides=("cpdb-backend-cups")
conflicts=("cpdb-backend-cups")

source=("cpdb-backend-cups::git+https://github.com/OpenPrinting/cpdb-backend-cups.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cpdb-backend-cups"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/cpdb-backend-cups"
  ./autogen.sh
}

build() {
  cd "$srcdir/cpdb-backend-cups"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/cpdb-backend-cups"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
