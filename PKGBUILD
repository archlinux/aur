# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnpupnp
pkgver=6.0.2
pkgrel=1
pkgdesc="C++ base UPnP library, derived from Portable UPnP, a.k.a libupnp"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv7h aarch64)
license=(BSD)
depends=(glibc gcc-libs curl expat libmicrohttpd)
provides=(libnpupnp.so)
source=("https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-${pkgver}.tar.gz")
sha256sums=('d40fa148020b99b7a51a91a963b998ca41cac8c95290629cd04a1d7062f68606')

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
