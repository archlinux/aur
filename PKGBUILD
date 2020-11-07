# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tty-qlock'
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimal, curses-based clock, for your terminal. Inspired by the QlockTwo by Biegert&Funk'
arch=('x86_64')
url='https://github.com/joshdk/tty-qlock'
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9a075e3d645910bb60946fd5d39aed1241c41868f3778a09d70099312dc39ba5')

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"
  go build -v -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
