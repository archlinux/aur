# Maintainer: Ben Golberg <ben@benaaron.dev>

pkgname=gemcert
pkgver=0
pkgrel=1
pkgdesc="A simple tool for creating self-signed certs for use in Geminispace."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
makedepends=('go')
url="https://tildegit.org/solderpunk/gemcert"
license=('BSD')
source=("gemcert::git+https://tildegit.org/solderpunk/gemcert.git")
sha256sums=('SKIP')

prepare() {
	cd gemcert
	mkdir -p build/
}

build() {
  cd gemcert
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/gemcert main.go
}

check() {
  cd gemcert
  go test ./...
}

package() {
  cd gemcert
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
