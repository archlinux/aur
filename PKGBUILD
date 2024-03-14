# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=slurp-go
_pkgname=slurp
pkgver=0.1.0
pkgrel=0
pkgdesc='tool for exporting data from and importing data to Fediverse instances written in Go'
arch=('x86_64')
url="https://github.com/VyrCossont/$_pkgname"
license=('GPL3')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a730289eea1d1486dbe28f79b20a3a1039855fde00c2ba1f2151924011c72716')

prepare(){
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go mod download
  go build -o build 
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
