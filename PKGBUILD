# Maintainer: aditya-K2 <adityakurdunkar2@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gspt-git
pkgver=r255.8fbd92e
pkgrel=1
pkgdesc='Spotify for Terminal written in Go.'
arch=('x86_64')
url="https://github.com/aditya-K2/gspt"
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
    go build -v -o build
}

package() {
    cd "$pkgname"
    install -D build/gspt -t "$pkgdir/usr/bin/"
}
