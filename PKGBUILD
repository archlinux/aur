# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=wg-cmd
pkgver=0.1.10
pkgrel=1
pkgdesc="TUI for managing WireGuard configuration files "
arch=(x86_64)
url="https://github.com/AndrianBdn/wg-cmd"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndrianBdn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6aa1407626edf25d825d24fc354438b98aab8029d197ddfea86bc752030136bc9c5e13b29257f6f795aec96336df46240aef95d0880e3137c07c591fdd8958f6')


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
  install -vDm755 $pkgname-$pkgver/build/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -vDm644 $pkgname-$pkgver/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
