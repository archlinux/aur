# Maintainer: aditya-K2 <adityakurdunkar2@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gomp-git
pkgver=r333.9b2a4fe
pkgrel=1
pkgdesc='MPD client inspired by ncmpcpp written in GO.'
arch=('x86_64')
url="https://github.com/aditya-K2/gomp"
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$pkgname"
   mkdir -p build
}

build() {
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    cd "$pkgname"
    go build -o build
}

package() {
    cd "$pkgname"
    install -D build/gomp -t "$pkgdir/usr/bin/"
}
