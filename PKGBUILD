# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=("any")
url="https://github.com/agejevasv/goradion"
pkgver="v0.5.6"
pkgrel=1
license=("Unlicense")
makedepends=("go")
depends=("mpv")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('88d57e352c559a6e078f39d22e2cdf8e562ff5c7dc394573ea11afa1e09b1f649292df2ee85000095e0a6ed09014b62118261d7c4380de4ce73fb4711e9acbd8')

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
