# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>
# Contributor: FabioLolix <fabio [d00t] loli [AT] disroot [dot.] org>
# Maintainer: Denis Proskurin <dpvpro [AT] gmail [dot.] com>

pkgname=dms
pkgver=1.7.2
pkgrel=1
pkgdesc="UPnP DLNA Digital Media Server"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/anacrolix/dms/"
license=(BSD)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anacrolix/dms/archive/v${pkgver}.tar.gz")
sha256sums=('696f49409e4b079ca76ed0b836134f5d34558027ca1346b4d224353151def0d9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # I comment export local GOPATH. It will be used common GOPATH for modcache.
  # Use "go clean -modcache" for cleaning local modules
  # export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -buildmode=pie \
    .
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 dms "${pkgdir}/usr/bin/dms"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
