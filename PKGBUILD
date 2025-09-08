# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=fjira
pkgver=1.4.7
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
arch=('x86_64')
url='https://github.com/mk-5/fjira'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/mk-5/fjira.git#tag=${pkgver}")
b2sums=('7501b196d0cfc38e8ebb302e476df1ea98376af8a66361e8bebdbf0db06393f26ae76151b0bc724e84a1683e6e5fef2caa5f151c2bf660d56824bba140e8d20f')

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
