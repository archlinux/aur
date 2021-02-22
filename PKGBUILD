# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnsmorph
pkgver=1.2.8
pkgrel=1
pkgdesc='Domain name permutation engine written in Go'
arch=('any')
url='https://github.com/netevert/dnsmorph'
license=('MIT')
makedepends=('go')
source=("https://github.com/netevert/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea4836a097cf84d080439f85310a5872e4b545b0d430c5df90e3a2e46d110481')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -extldflags ${LDFLAGS}"
  go build -o dnsmorph -ldflags="${_LDFLAGS}" ./
}

package() {
  # binary
  install -Dm755 "${pkgname}-${pkgver}"/dnsmorph "${pkgdir}/usr/bin/dnsmorph"
}
