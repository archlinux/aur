# Maintainer: mosquito <mosquito@email.cn>
pkgname=bobibo
pkgver=1.2.0
pkgrel=1
pkgdesc="A cli-app, convert pictures to ascii arts."
arch=("x86_64")
url="https://github.com/orzation/bobibo"
license=('GPL3')
makedepends=('go>=1.17')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/orzation/bobibo/archive/v${pkgver}.tar.gz")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver/cli"
  make build
  go clean -modcache
}

package() {
  cd "$srcdir/$pkgname-$pkgver/cli"
  make DESTDIR="$pkgdir" install
}

sha256sums=('ce72366c176646c312abe288130566695fd87d6ecf1b838abf85a9f150586ced')
