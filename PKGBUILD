# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=ssh-chat
pkgver=1.9
pkgrel=1
pkgdesc='Chat over SSH'
arch=('x86_64')
url='https://github.com/shazow/ssh-chat'
license=('MIT')
makedepends=('go')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('74792d29472e1a083e9af0632c0989412602f33cf5ac01bc7badc73bb2f0b31d')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"
  go build -v -o "${_pkgname}" ./cmd/ssh-chat
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
