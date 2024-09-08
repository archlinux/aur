# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=mp3cat
pkgver=4.2.2
pkgrel=3
pkgdesc="A command line utility for joining MP3 files."
arch=('any')
url="https://www.dmulholl.com/dev/mp3cat.html"
license=('Unlicense')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dmulholl/mp3cat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('457e680e5b05e8a5a50a8b557372e23bf797026f43253efdff14b8137f214470')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-compressdwarf=false"
  export GOPATH="${srcdir}"
  go build -v
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm755 -t "${pkgdir}/usr/bin/" mp3cat
}

# vim:set ts=2 sw=2 et:
