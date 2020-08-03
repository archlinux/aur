# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=ssh-chat
pkgver=1.10
pkgrel=1
pkgdesc='Chat over SSH'
arch=('x86_64')
url='https://github.com/shazow/ssh-chat'
license=('MIT')
makedepends=('go')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('63f795e24a125db7ed58f12b0a1a8ac6b6329348935a68433d59e4a18a3899ff')

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
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
