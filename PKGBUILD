# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="go-http-file-server"
_binname="ghfs"
pkgver=1.18.1
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('any')
url="https://github.com/mjpclab/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.18')
provides=("${_binname}")
conflicts=("${_binname}")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3acf2f36b5e7bc05f5ea04a2ce92cd1d9a009980ee14fd9246348a09f6cfab8e')

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${_binname}" .
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
