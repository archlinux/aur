# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: 404
# Contributor carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zann at gmail dot com>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=ode-011
pkgver=0.11.1
pkgrel=2
pkgdesc="An open source, high performance library for simulating rigid body dynamics"
arch=('i686' 'x86_64')
url="http://www.ode.org"
license=('LGPL' 'BSD')
options=('!libtool')
provides=('ode')
conflicts=('ode')
source=("http://downloads.sourceforge.net/opende/ode-$pkgver.tar.bz2"
        "ptr_int_comparison.patch")
md5sums=('712579afabc2a15aa56e399f76171477'
         'f25456ed963238e460fbaf2072bc179c')

prepare() {
  cd ode-$pkgver
  patch -Np2 -i "${srcdir}/ptr_int_comparison.patch"
}

build() {
  cd ode-$pkgver

  LIBS="$LIBS -lX11" ./configure --prefix=/usr --enable-shared \
    --enable-release --disable-asserts --with-trimesh=opcode

  make
}

package() {
  cd ode-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
