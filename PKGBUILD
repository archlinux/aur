# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=fjira
pkgver=1.5.5
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
arch=('x86_64')
url='https://github.com/mk-5/fjira'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/mk-5/fjira.git#tag=${pkgver}")
b2sums=('347f6da04ba0a149ea253016fed63c05c85402ff4d3d75793e266fdc227f991343527edfd3ce6d53092525410aa42baca60acc85c7f4ef2a68ccc156fa52f84f')

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
