# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dmon
pkgver=0.6.0
pkgrel=1
pkgdesc='Toolset for daemonizing and supervising processes'
arch=(i686 x86_64 arm)
url=https://github.com/aperezdc/dmon
license=(custom:MIT)
depends=(glibc)
makedepends=(make)
conflicts=(dmon-git)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=(b2eead6960294a56726f1ca04276748e5b77aff179c40ca3f9839b29c9ddf02301479fb3b837cc88cabf0913724512e2cecfd55878f82cb9d96a2812d7d047e1)

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
