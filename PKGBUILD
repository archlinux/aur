pkgname=gospt
pkgver=0.0.3
pkgrel=1
pkgdesc='Spotify TUI And CLI written in Go'
arch=('x86_64')
url="https://gitea.asdf.cafe/abs3nt/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0f47f157680df65dcded6fa8815ad4339eef13e6e922327f0e3134b1f9abbbaf')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
