# $Id: PKGBUILD 87580 2010-08-17 07:10:11Z jgc $
#Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxvmc
pkgname=lib32-$_pkgbasename
pkgver=1.0.6
pkgrel=2
pkgdesc="X11 Video Motion Compensation extension library (32-bit)"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-libxv>=1.0.5' $_pkgbasename)
makedepends=('pkgconfig' gcc-multilib)
options=('!libtool')
source=(${url}/releases/individual/lib/libXvMC-${pkgver}.tar.bz2)
sha1sums=('4ace7e7ce6b646b5715b2efa561affc89bc87f91')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/libXvMC-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd ${srcdir}/libXvMC-${pkgver}

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"

}
