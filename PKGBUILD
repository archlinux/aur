#Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxvmc
pkgname=lib32-$_pkgbasename
pkgver=1.0.8
pkgrel=1
pkgdesc="X11 Video Motion Compensation extension library (32-bit)"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-libxv>=1.0.5' $_pkgbasename)
makedepends=('pkgconfig' gcc-multilib)
options=('!libtool')
source=(${url}/releases/individual/lib/libXvMC-${pkgver}.tar.bz2)
sha256sums=('5e1a401efa433f959d41e17932b8c218c56b931348f494b8fa4656d7d798b204')

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
