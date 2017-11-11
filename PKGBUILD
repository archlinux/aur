# $Id$
# Maintainer : Christian Duerr <contact@christianduerr.com>
# Original PKGBUILD by
# - Christian Rebischke <Chris.Rebischke@archlinux.org>
# - Giovanni Scafora <giovanni@archlinux.org>
# - lucke <lucke at o2 dot pl>

pkgname=weechat-python3
pkgver=1.9.1
pkgrel=1
pkgdesc="Weechat compiled with Python3 instead of Python2, experimental"
arch=('i686' 'x86_64')
url="http://www.weechat.org/"
license=('GPL')
depends=('gnutls' 'curl' 'libgcrypt')
makedepends=('cmake' 'perl' 'python3' 'lua' 'tcl' 'ruby' 'aspell' 'guile2.0' 'asciidoctor')
optdepends=('perl' 'python3' 'lua' 'tcl' 'ruby' 'aspell' 'guile2.0')
source=("weechat-${pkgver}.tar.xz::https://www.weechat.org/files/src/weechat-${pkgver}.tar.xz"
        "weechat-${pkgver}.tar.xz.asc::https://www.weechat.org/files/src/weechat-${pkgver}.tar.xz.asc")
sha512sums=('552e9248e86db7fe53cd6539084e6c5e8548b8858b27c02326d04925d81ef09e123225af5c1f5550b262be5a1249fd8750fdda8d9877c3df918cc30b5e0953fa'
            'SKIP')
validpgpkeys=('A9AB5AB778FA5C3522FD0378F82F4B16DEC408F8')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake -Wno-dev "${srcdir}/weechat-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.6m.so \
        -DENABLE_MAN=ON \
        -DENABLE_DOC=ON \
        -DENABLE_PYTHON3=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
