# Maintainer: Amolith <amolith@secluded.site>
pkgname=goradion
pkgdesc='Terminal based online radio player'
arch=("any")
url="https://github.com/agejevasv/goradion"
pkgver="v0.3.6"
_tag="${pkgver}-build3"
_dir="${pkgname}-${_tag#v}"
pkgrel=1
license=("Unlicense")
makedepends=("go")
depends=("mpv")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('d3f60cc395f0e24540a55639cef3c46bd933b2827a9ea6614518cc57bb9a7c1737b4f22655e80a72a1c90e2cb36d94f2a7d0f7e933d86abd8393c4108261a4ca')

build() {
  cd "${_dir}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${pkgname}" .
}

check() {
  cd "${_dir}"
  go test ./...
}

package() {
  cd "${_dir}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
