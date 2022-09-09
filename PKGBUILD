# Maintainer: Sick Codes <info at sick dot codes>

pkgname=sourcemapper-git
_pkgname=sourcemapper
pkgver=r24.5388f8e
pkgrel=1
pkgdesc='Extract JavaScript source trees from Sourcemap files'
arch=('x86_64')
url="https://github.com/denandz/${_pkgname}"
license=('BSD')
makedepends=('go')
source=(${_pkgname}::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get
  go build
}

package() {
  cd "${_pkgname}"
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
