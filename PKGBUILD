# Contributor: Eric Engestrom <aur@engestrom.ch>

_pkgname=bichon
pkgname=$_pkgname-git
pkgver=r461.f4c9d17
pkgrel=1
pkgdesc="TUI for reviewing GitLab merge requests"
arch=(x86_64)
url=https://gitlab.com/bichon-project/bichon
license=(Apache)
makedepends=(git go)
source=("git+$url")
sha256sums=('SKIP')
conflicts=($_pkgname)
provides=($_pkgname)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$_pkgname"
  GOBIN="$pkgdir"/usr/bin/ go install
}
