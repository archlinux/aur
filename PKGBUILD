# Maintainer: Paul Spruce <paul.spruce@gmail.com>
pkgname=waybackurls
pkgver=0.1.0
pkgrel=1
pkgdesc="Fetch all the URLs that the Wayback Machine knows about for a domain"
arch=("x86_64")
url="https://github.com/tomnomnom/waybackurls"
license=("MIT")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "$pkgname-$pkgver"  
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.mkd "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
