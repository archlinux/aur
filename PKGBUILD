# Maintainer: Borhaneddine GUEMIDI <guemidiborhane@gmail.com>
pkgname=salatux-git
pkgver=r1.6cd8bd99
pkgrel=1
pkgdesc="CLI tool to fetch prayers times, with emphasis in waybar integration"
arch=('x86_64' 'aarch64')
url="https://github.com/guemidiborhane/salatux"
license=('MIT')
makedepends=('go' 'git')
provides=('salatux')
conflicts=('salatux')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o salatux ./cmd/main/main.go
}

package() {
  cd "$pkgname"
  install -Dm755 salatux "$pkgdir/usr/bin/salatux"
}
