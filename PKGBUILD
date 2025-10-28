# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=fjira
pkgver=1.4.10
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
arch=('x86_64')
url='https://github.com/mk-5/fjira'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/mk-5/fjira.git#tag=${pkgver}")
b2sums=('782112a99a8f58d1fd2260d98ef7f6a85f4db0121c6ce92785054b99e49e6f0e58a5cdd1ea2adf2d7fa9df09efd61727e31a7406d800b5f2df241da2a7ff6f4c')

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
