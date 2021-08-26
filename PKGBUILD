#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=g64drive
pkgver=0.3.1
pkgrel=1
pkgdesc='Portable Linux/Mac tool for Retroactive 64drive'
arch=('x86_64')
license=('MIT')
url='https://github.com/rasky/g64drive'
makedepends=('go')
depends=('libftdi')
source=("https://github.com/rasky/g64drive/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4cac4075ebe44d5a620ce57d52f039e650e33bdb490f4148d255445409d8fdf4')

prepare() {
  cd g64drive-${pkgver}
  mkdir -p build/
}

build() {
  cd g64drive-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd g64drive-${pkgver}
  install -Dm755 build/g64drive "$pkgdir"/usr/bin/g64drive

  #install license
  install -Dm644 LICENSE.mit "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
