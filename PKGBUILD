# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>
# Contributor: FabioLolix <fabio [d00t] loli [AT] disroot [dot.] org>

pkgname=dms
pkgver=1.6.0
pkgrel=1
pkgdesc="UPnP DLNA Digital Media Server"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/anacrolix/dms/"
license=(BSD)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anacrolix/dms/archive/v${pkgver}.tar.gz")
sha256sums=('66dfe8ed29eb3a7875e1ee81b1e3e38f3a1363df8265c96820186992c9956361')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie \
    .
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 dms "${pkgdir}/usr/bin/dms"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
