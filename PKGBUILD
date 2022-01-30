# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=libusrsctp
pkgver=0.9.5.0
pkgrel=4
pkgdesc="A portable SCTP userland stack"
arch=(i686 x86_64)
url=https://github.com/sctplab/usrsctp
license=(custom)
depends=(glibc)
makedepends=(automake autoconf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('7b28706449f9365ba9750fd39925e7171516a1e3145d123ec69a12486637ae2393ad4c587b056403298dc13c149f0b01a262cbe4852abca42e425d7680c77ee3')

prepare () {
  cd ${pkgname#lib}-${pkgver}
  ./bootstrap
}

build() {
  mkdir -p _build
  cd _build
  "../${pkgname#lib}-${pkgver}/configure" \
    --prefix=/usr \
    --disable-debug \
    --disable-warnings-as-errors \
    --disable-dependency-tracking
  make V=0
}

package() {
  make -C _build DESTDIR="$pkgdir/" install
  install -Dm644 "${pkgname#lib}-${pkgver}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
