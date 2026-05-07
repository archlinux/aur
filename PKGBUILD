# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ngtop
pkgver=0.4.6
pkgrel=1
pkgdesc='Request analytics from the nginx access logs'
url='https://github.com/facundoolano/ngtop'
license=('GPL-3.0')
arch=('x86_64')
makedepends=('go')
source=("https://github.com/facundoolano/ngtop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41fe7b63277c67f521155030e028b53ebc0649fb34919bc31785b0b3723b5c6f')
b2sums=('3a9bb9d1fe78c2ec53e5572809670be24a0a7190c59005c9fbc30d6700c6b61e017ff5ea866e62d0764d317f177687b738540abbdebdd293056da7310a39ee47')

prepare() {
  cd "ngtop-$pkgver"

  mkdir -p build
}

build() {
  cd "ngtop-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build .
}

package() {
  cd "ngtop-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" build/ngtop
}
