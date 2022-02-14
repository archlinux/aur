pkgname=bwplotka-bingo
_pkgname=bingo
pkgver=0.5.2
pkgrel=1
pkgdesc='Automated versioning of Go package level binaries'
arch=('x86_64')
url="https://github.com/bwplotka/bingo"
license=('GPL')
makedepends=('go')
conflicts=(bingo)
source=("https://github.com/bwplotka/bingo/archive/v$pkgver.tar.gz")
sha256sums=('a92e1b576f283e39ee052e5ceeb1580befd6b8e181b40b48282e801ffc1fe173')


build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -v"
  go build
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
