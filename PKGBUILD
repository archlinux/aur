# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnpupnp
pkgver=5.0.1
pkgrel=1
pkgdesc="C++ base UPnP library, derived from Portable UPnP, a.k.a libupnp"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(BSD)
depends=(curl expat libmicrohttpd)
source=("https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-${pkgver}.tar.gz")
sha256sums=('3fbc2a63e12c0db2235926017e82e78037278a3ec7f97e1a4e160a5db3576a1c')

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
