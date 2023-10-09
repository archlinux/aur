# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libtirpc
pkgver=1.3.4
pkgrel=1
pkgdesc='Transport Independent RPC library (SunRPC replacement)'
arch=(x86_64)
url=http://libtirpc.sourceforge.net/
license=(BSD)
depends=(
  lib32-krb5
  libtirpc
)
source=(https://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-${pkgver}.tar.bz2)
b2sums=('33371e83e9f54e9d6d434b75d3a95bedefce63050846483471e302b1fbb3b63a18db90b652050c43e1c6e42b03e34bafb2fb6ae89787f05af0cf747319825424')

prepare() {
  cd libtirpc-${pkgver}
  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd libtirpc-${pkgver}
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc
  make
}

package() {
  cd libtirpc-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{include,share}}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtirpc "${pkgdir}"/usr/share/licenses/lib32-libtirpc
}

# vim: ts=2 sw=2 et:
