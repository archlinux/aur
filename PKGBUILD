#Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxvmc
pkgname=lib32-$_pkgbasename
pkgver=1.0.9
pkgrel=1
pkgdesc="X11 Video Motion Compensation extension library (32-bit)"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-libxv>=1.0.5' $_pkgbasename)
makedepends=('pkgconfig' gcc-multilib)
options=('!libtool')
source=(${url}/releases/individual/lib/libXvMC-${pkgver}.tar.bz2{,.sig})
sha256sums=('0703d7dff6ffc184f1735ca5d4eb9dbb402b522e08e008f2f96aee16c40a5756'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

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
