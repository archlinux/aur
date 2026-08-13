# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>
# Contributor: FabioLolix <fabio [d00t] loli [AT] disroot [dot.] org>
# Maintainer: Denis Proskurin <dpvpro [AT] gmail [dot.] com>

pkgname=dms
pkgver=1.8.0
pkgrel=1
pkgdesc="UPnP DLNA Digital Media Server"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/anacrolix/dms/"
license=(BSD)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anacrolix/dms/archive/v${pkgver}.tar.gz")
sha256sums=('a536c7b73eef88264732360bd508a7cfa0cb3a8a8bd1883e424bc7401f3fdb35')

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
