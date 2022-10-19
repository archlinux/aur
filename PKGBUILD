# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnpupnp
pkgver=5.0.0
pkgrel=1
pkgdesc="C++ base UPnP library, derived from Portable UPnP, a.k.a libupnp"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(BSD)
depends=(expat libmicrohttpd)
source=("https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-${pkgver}.tar.gz")
sha256sums=('2e5648cf180a425ef57b8c9c0d9dbd77f0314487ea0e0a85ebc6c3ef87cab05b')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
