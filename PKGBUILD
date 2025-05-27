# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>
# Contributor: FabioLolix <fabio [d00t] loli [AT] disroot [dot.] org>
# Maintainer: Denis Proskurin <dpvpro [AT] gmail [dot.] com>

pkgname=dms
pkgver=1.7.1
pkgrel=3
pkgdesc="UPnP DLNA Digital Media Server"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/anacrolix/dms/"
license=(BSD)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anacrolix/dms/archive/v${pkgver}.tar.gz")
sha256sums=('dfcec174db95d8115be61d318896ab11fddd4ab1d93fd9d2b2c75012af95f793')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # I comment export local GOPATH. It will be used common GOPATH for modcache.
  # Use "go clean -modcache" for cleaning 
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
