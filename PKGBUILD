# Contributor: Jan de Groot <jgc@archlinux.org>
_pkgbasename=libxpm
pkgname=lib32-$_pkgbasename
pkgver=3.5.10
pkgrel=1
pkgdesc="X11 pixmap library (32-bit)"
arch=(x86_64)
license=('custom')
url="http://xorg.freedesktop.org/"
depends=(lib32-libxt lib32-libxext $_pkgbasename)
makedepends=(xorg-util-macros gcc-multilib pkg-config)
options=('!libtool')
source=(${url}/releases/individual/lib/libXpm-${pkgver}.tar.bz2)
sha1sums=('eca9dbfa6253f7d6cc7d593dc83110c6c4876d7c')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/libXpm-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXpm-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
