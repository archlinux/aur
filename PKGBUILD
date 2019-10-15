# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Co-maintainer/contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=3.0.0
pkgrel=4
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
provides=(gotop)
conflicts=(gotop)
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d5147080bb6057f0bf0900b38438e89aa066959c845bdd4c84a9c9fe478b176f')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -mod vendor \
    .
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
}
