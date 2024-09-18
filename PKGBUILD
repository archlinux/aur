# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=("any")
url="https://github.com/agejevasv/goradion"
pkgver="v0.4.5"
pkgrel=2
license=("Unlicense")
makedepends=("go")
depends=("mpv")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('52a97852bfc5ce56dbc5ed2118c7ffabcd4d28e6b3385b34ec87459cb10f028ff9dc8af6b5cc0456d5d57f164008960250b8c9bf30471e0cabfd937c97e95617')

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
