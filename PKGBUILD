# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libtirpc
pkgver=1.3.3
pkgrel=2
pkgdesc='Transport Independent RPC library (SunRPC replacement)'
arch=(x86_64)
url=http://libtirpc.sourceforge.net/
license=(BSD)
depends=(
  lib32-krb5
  libtirpc
)
source=(https://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-${pkgver}.tar.bz2)
b2sums=('e229869b05103d912b677f78648dce1f7fa7649bdf44b782a5fb97635eecf07f768bbc0ef25c0f065c8253fbe37c12b80934d9102b7345adfc4102897458b487')

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
