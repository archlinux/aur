# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="gaper"
pkgver=1.1.0
pkgrel=1
pkgdesc="Builds and restarts a Go project when it crashes or some watched file changes"
arch=('any')
url="https://github.com/maxcnunes/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('make' 'go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('67ccb67e55c5ba2b4b1972950698efbac5d155594b58250b90c6f5fb18f84200')

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make test
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
