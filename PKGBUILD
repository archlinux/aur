# Maintainer: mosquito <mosquito@email.cn>
pkgname=bobibo
pkgver=1.1.0
pkgrel=1
pkgdesc="A cli-app, convert pictures to ascii arts."
arch=("x86_64")
url="https://github.com/orzation/bobibo"
license=('GPL3')
makedepends=('go>=1.17' 'upx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/orzation/bobibo/archive/v${pkgver}.tar.gz")
sha256sums=('8aba2b783c8d6812ba893d8ac9fb867b74796d9df9f2a22cfd3aadface4f0eb8')

optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver/cli"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/cli"
  make DESTDIR="$pkgdir" install
}
