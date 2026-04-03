# Maintainer: Natounlars <198830487@qq.com>

pkgname=cpdb-libs-git
pkgver=2.0b8.r5.gf27fc8a
pkgrel=1
pkgdesc="Common Print Dialog Backends - Frontend/Backend communication libraries (2nd generation)"
arch=('x86_64' 'aarch64')
url="https://openprinting.github.io/"
license=('GPL2' 'GPL3')
depends=(
    'glib2'
    'glib2-devel'
    'dbus'
    'libcups'
    'libcupsfilters'
)
makedepends=(
    'git'
    'autoconf'
    'automake'
    'libtool'
    'pkg-config'
    'gettext'
)
provides=("cpdb-libs")

source=("cpdb-libs::git+https://github.com/OpenPrinting/cpdb-libs.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cpdb-libs"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/cpdb-libs"
  ./autogen.sh
}

build() {
  cd "$srcdir/cpdb-libs"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/cpdb-libs"
  make check
}

package() {
  cd "$srcdir/cpdb-libs"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
