# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Sean E. Russell <ser@ser1.net> -> also the program developer
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=4.0.0
pkgrel=1
pkgdesc="A terminal based graphical activity monitor inspired by gtop and vtop"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/xxxserxxx/gotop"
license=(AGPL3)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=("glibc")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CGO_ENABLED=0
  BUILDDATE=$(date +%Y%m%dT%H%M%S)
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -X main.BuildDate=${BUILDDATE} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/gotop
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
}
md5sums=('f21d9386ea8fcf5bf0d1f3b4ce0bf04b')
