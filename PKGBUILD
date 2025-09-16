# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=fjira
pkgver=1.4.8
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
arch=('x86_64')
url='https://github.com/mk-5/fjira'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/mk-5/fjira.git#tag=${pkgver}")
b2sums=('d75bee8f6cbd14aad9e538b6ff15b6d3324f1a1cd9d85dcf65ebd48da80631d728b77776977c17130d533131d0dbe2007af27c47d7e4bdfa120de54d5c8f23a5')

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
