# Maintainer: Hao Long <aur@esd.cc>

pkgname=pkger
pkgver=0.17.1
pkgrel=1
pkgdesc="Embed static files in Go binaries"
arch=("x86_64" "i686")
url="https://github.com/markbates/pkger"
license=("MIT")
provides=('pkger')
conflicts=('pkger')
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('da775b5ec5675f0db75cf295ff07a4a034ba15eb5cc02d278a5767f387fb8273')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 cmd/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
