pkgname=base16-builder-go
_cmd='base16-builder'
provides=("${_cmd}")
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple builder for base16 templates and schemes'
arch=('x86_64')
url="https://github.com/belak/base16-builder-go"
makedepends=()
makedepends=('git' 'go')
source=("$url/archive/v${pkgver}.zip")
sha256sums=('3aae9b01dc48ee5b68665b90e3832489141ea44eb36bf17dc0840c1a2d533746')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ${provides[0]} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" .
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${_cmd}" "${pkgdir}/usr/bin/${_cmd}"
}
