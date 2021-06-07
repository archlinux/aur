# Maintainer: Endo Aya <endoaya@protonmail.ch>
# Contributor: Jan de Groot <jgc@archlinux.org>
_pkgbasename=libxpm
pkgname=lib32-$_pkgbasename
pkgver=3.5.13
pkgrel=2
pkgdesc="X11 pixmap library (32-bit)"
arch=(x86_64)
license=('custom')
url="https://xorg.freedesktop.org/"
depends=(lib32-libxt lib32-libxext lib32-gcc-libs $_pkgbasename)
makedepends=(xorg-util-macros gcc-multilib pkg-config)
options=('!libtool')
source=(${url}/releases/individual/lib/libXpm-${pkgver}.tar.bz2)
sha512sums=('3b8f6e926272f39b1d95135c2274c00f5aaee1f9fb2ef79f71628df5edeb7ba20158819ef6a778101cc4092493a3b5b613c53634fdccadcc0fc85f0605e5e9a5')

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
