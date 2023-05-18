# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=1.15.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
optdepends=("highlight: source code syntax highlighter")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/walles/moar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db6d541844163938847286459186ee317dc94459f5cf08c6a81d8e8334fa54b3')

build() {

 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${pkgname}-${pkgver}"

   go build -ldflags="-s -w -X main.versionString=${pkgver}" -o "${pkgname}"
}

package() {

 cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 moar "${pkgdir}/usr/bin/moar"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 moar.1 "${pkgdir}/usr/share/man/man1/moar.1"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
