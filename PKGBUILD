# Maintainer: mosquito <mosquito@email.cn>
pkgname=bobibo
pkgver=1.3.0
pkgrel=1
pkgdesc="A cli-app, convert pictures to ascii arts."
arch=("x86_64")
url="https://github.com/orzation/bobibo"
license=('GPL3')
makedepends=('go>=1.18')
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
sha256sums=('679c4db39d407aedc797621183f37ba270a441ee505c4a079b5401296e24e756')
