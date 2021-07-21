# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Sean E. Russell <ser@ser1.net> -> also the program developer
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=4.1.2
pkgrel=1
pkgdesc="A terminal based graphical activity monitor inspired by gtop and vtop"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/xxxserxxx/gotop"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/gotop
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('81518fecfdab4f4c25a4713e24d9c033ba8311bbd3e2c0435ba76349028356da')
