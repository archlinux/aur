# Maintainer: Mara Loon <mara@the-witch.com>
pkgname=pickdate
pkgver=0.0.1
pkgrel=1
pkgdesc="Datepicker for terminal"
arch=('x86_64')
url="https://github.com/maraloon/$pkgname"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver::https://github.com/maraloon/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
}
