# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dmon
pkgver=0.5.1
pkgrel=1
pkgdesc='Toolset for daemonizing and supervising processes'
arch=(i686 x86_64 arm)
url=https://github.com/aperezdc/dmon
license=(custom:MIT)
depends=(glibc)
makedepends=(make)
conflicts=(dmon-git)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=(c833c64d6733ece6dceb241ef81d601d849fe5e6e6fe154b397187ff5a2f39f1db5cf4456188ab8c53b0a4f32acddc83c760fd50e746889474add1f9ecd624d7)

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
