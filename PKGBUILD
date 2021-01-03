# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>
# Contributor: FabioLolix <fabio [d00t] loli [AT] disroot [dot.] org>

pkgname=dms
pkgver=1.2.0
pkgrel=1
pkgdesc="UPnP DLNA Digital Media Server"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/anacrolix/dms/"
license=(BSD)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anacrolix/dms/archive/v${pkgver}.tar.gz")
sha256sums=('b3b1e5c725ce611920b4179f3f11945521c6a557485209190df319ecf9d5a004')

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
