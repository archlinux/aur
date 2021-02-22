# Maintainer: Nemo <archlinux [at] captnemo.in>

pkgname=karn
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage multiple Git identities with ease"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/prydonius/karn"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')

source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('d71197b63d92d2fde02cf8f1365c71df08001dde4d0db3f0463f8f02b4587af894bd3ca67ac2cc65278b6995d1a272a215572ea5d48757627f86f2c7deeab7dc')


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
	go get
	go build -o build ./cmd/karn
}

package() {
  cd "$pkgname-$pkgver"
	install -DT build/$pkgname "$pkgdir/usr/bin/karn"
}
