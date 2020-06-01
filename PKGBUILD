# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Sean E. Russell <ser@ser1.net> -> also the program developer
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=3.5.3
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
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie \
    ./cmd/gotop
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
}
sha256sums=('fd9ecc1f9fcd622dc88f93af87fdf6a12020cec424d742deb1865853b38d5605')
