# $Id: PKGBUILD 228975 2015-01-13 15:48:05Z dreisner $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: JaDa <jada@archlinux.us>
# Contributor: Joaquim Pedro <osmano807@gmail.com>
# Contributor: Jan Rüegg <rggjan@gmail.com>

pkgname=gperftools-git
_pkgname=gperftools
pkgver=2.4.r46.g6627f92
pkgrel=1
pkgdesc="Fast, multi-threaded malloc and nifty performance analysis tools"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gperftools/"
license=('BSD')
depends=('perl')
provides=('libtcmalloc.so'
          'libprofiler.so'
          'libtcmalloc_debug.so'
          'libtcmalloc_and_profiler.so'
          'libtcmalloc_minimal.so'
          'libtcmalloc_minimal_debug.so'
          'gperftools')
conflicts=('gperftools')
optdepends=('graphviz: pprof graph generation'
            'gv: pprof postscript generation')
source=("git+https://github.com/gperftools/gperftools.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/gperftools.//'
}

build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr --enable-frame-pointers
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
