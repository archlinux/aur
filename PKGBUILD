# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>

pkgname=lib32-libmodplug
pkgver=0.8.9.0
pkgrel=4
pkgdesc='A MOD playing library'
arch=(x86_64)
url=http://modplug-xmms.sourceforge.net/
license=(custom)
depends=(
  lib32-gcc-libs
  lib32-glibc
  libmodplug
)
source=(https://downloads.sourceforge.net/project/modplug-xmms/libmodplug/${pkgver}/libmodplug-${pkgver}.tar.gz)
sha256sums=(457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de)

build() {
  cd libmodplug-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd libmodplug-${pkgver}

  make DESTDIR="${pkgdir}" install
  sed 's|includedir=${prefix}/include|includedir=${prefix}/include/libmodplug/|' -i "${pkgdir}"/usr/lib32/pkgconfig/libmodplug.pc
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libmodplug "${pkgdir}"/usr/share/licenses/lib32-libmodplug
}

# vim: ts=2 sw=2 et:
