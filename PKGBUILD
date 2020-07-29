# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=waybackurls
pkgname=${_pkgname}-git
pkgver=0.0.2.r6.g89da10c
pkgrel=1
pkgdesc='Fetch all the URLs that the Wayback Machine knows about for a domain'
arch=('x86_64')
url='https://github.com/tomnomnom/waybackurls'
license=('unknown')
makedepends=('git' 'go')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "${_pkgname}"
  go build -v -o waybackurls main.go
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/README.mkd" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
