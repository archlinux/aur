# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=("any")
url="https://github.com/agejevasv/goradion"
pkgver="v0.6.1"
pkgrel=1
license=("Unlicense")
makedepends=("go")
depends=("mpv")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('b74df72beb1e0633addc443603d6b73ec38165fc106031853f5470d8a1319cb105b1a36e1446afb34deb42f4aaa59bdd7ff4cba081143e43cfe773b3b11e344c')

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
