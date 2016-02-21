# Maintainer: Severen Redwood <severen@shrike.me
# Contributors: Dave Reisner <dreisner@archlinux.org>
#               Matthias Blaicher <matthias@blaicher.com>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname=capnproto-git
pkgver=r1490.ee64a21
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system"
arch=('i686' 'x86_64')
url="http://kentonv.github.io/capnproto/"
license=('MIT')
makedepends=('git' 'subversion')
conflicts=('capnproto')
provides=('capnproto')
source=("git+https://github.com/kentonv/capnproto.git"
        "gtest::svn+http://googletest.googlecode.com/svn/tags/release-1.7.0")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "capnproto"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "capnproto/c++"
  ln -s "$srcdir/gtest"
  autoreconf -i
}

build() {
  cd "capnproto/c++"
  ./configure --prefix=/usr
  make
}

check() {
  cd "capnproto/c++"
  make check
}

package() {
  cd "capnproto/c++"
  make DESTDIR="$pkgdir" install

  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
