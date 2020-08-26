# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dmon
pkgver=0.5.0
pkgrel=1
pkgdesc='Toolset for daemonizing and supervising processes'
arch=(i686 x86_64 arm)
url=https://github.com/aperezdc/dmon
license=(custom:MIT)
depends=(glibc)
makedepends=(make)
conflicts=(dmon-git)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('c44c9fc629a28970f4b353f7b0a8d3e539e45142ebcc76832689d4df4891cd565bf9d3e817a4ffca904ed6d76605ef8b9df4bc934f7c2eab021033ff68642d8b')

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
