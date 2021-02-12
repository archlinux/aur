# Maintainer: Nemo <archlinux [at] captnemo.in>

pkgname=karn
pkgver=0.0.5
pkgrel=1
pkgdesc="Manage multiple Git identities with ease"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/prydonius/karn"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')

source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('23a33355ceefe4d1a76a31e551713b21f9054ea462a2a64c349b9bfb84f8698173df80c8b0d1a8a3c491d86df3d0130b8b91ce3aa74e491f9c5fa7b7d20e9e01')


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
