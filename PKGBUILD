# Maintainer: André Dias <diaso.andre@outlook.com>

pkgname=shield-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Secure SSH credential management with Zero Plaintext Files"
arch=('x86_64' 'aarch64')
url="https://github.com/dias-andre/shield"
license=("GPL3")
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9c9d5a532caf5213af73ba9b27400233b7a3faf918e0e8597fe3dd2d0d44cd4f')

build() {
  cd "shield-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o build/shield .
}

package() {
  cd "shield-${pkgver}"

  install -Dm755 build/shield "$pkgdir/usr/bin/shield"
  install -d -m755 "$pkgdir/etc/shield"
}
