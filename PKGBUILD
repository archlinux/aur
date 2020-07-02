# Maintainer: TankMissile <alecfeldman@disroot.org>

_pkgname=dec-decode
pkgname=$_pkgname-git
pkgver=r10.cf3ccaf
pkgrel=1
pkgdesc="An iso.dec decoder written in Go."
url="https://github.com/sammiq/$_pkgname"
arch=("x86_64")
license=("Unlicense")
makedepends=("go" "git")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd $_pkgname
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
