# Maintainer: mosquito <mosquito@email.cn>
pkgname=bobibo
pkgver=1.4.1
pkgrel=1
pkgdesc="A cli-app, convert pictures to ascii arts."
arch=("x86_64")
url="https://github.com/orzation/bobibo"
license=('GPL3')
makedepends=('go>=1.18')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/orzation/bobibo/archive/v${pkgver}.tar.gz")

build() {
 cd "$srcdir/$pkgname-$pkgver"

  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  make build
  go clean -modcache
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
sha256sums=('ee0c6b8aad954bbbf52b837bbde8a318af154f50f251ccea80c08c039ee23489')
