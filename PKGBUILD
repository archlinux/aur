# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=("any")
url="https://github.com/agejevasv/goradion"
pkgver="v0.6.2"
pkgrel=1
license=("Unlicense")
makedepends=("go")
depends=("mpv")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('2c0a61e27d079905a9d3ca175da1335a59daa6e3a6126b7f58b68289d2c782e056c107b15053adf01aa2b43490c3243c1c820baa175fd7957831891949f96994')

build() {
  cd "${pkgname}-${pkgver#v}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${pkgname}" .
}

check() {
  cd "${pkgname}-${pkgver#v}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver#v}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
