# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=fjira
pkgver=1.5.3
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
arch=('x86_64')
url='https://github.com/mk-5/fjira'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/mk-5/fjira.git#tag=${pkgver}")
b2sums=('0984d0e9a04346292c87d197c376c4e22065e5a4e4c1282ab869ba7418caf0db0596388c6478152318130956c82ba569826a0dad3f7006197f6e3906d5a971a9')

build() {
  cd ${pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fjira ./cmd/fjira-cli/
}

package() {
  cd ${pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
