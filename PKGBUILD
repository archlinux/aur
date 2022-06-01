pkgname=bwplotka-bingo
_pkgname=bingo
pkgver=0.6.0
pkgrel=1
pkgdesc='Automated versioning of Go package level binaries'
arch=('x86_64')
url="https://github.com/bwplotka/bingo"
license=('GPL')
makedepends=('go')
conflicts=(bingo)
source=("https://github.com/bwplotka/bingo/archive/v$pkgver.tar.gz")
sha256sums=('a192ae0a8e8358b4481d57a2027b0a1c65dbf6bd26c933bd063b251d27029c77')


build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -v"
  go build -v
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
