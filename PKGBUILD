# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=wg-cmd
pkgver=0.1.9
pkgrel=1
pkgdesc="TUI for managing WireGuard configuration files "
arch=(x86_64)
url="https://github.com/AndrianBdn/wg-cmd"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndrianBdn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('285777490365b758a529b4fe27155443842cf3bca739b4efb232bf9afbc41e37f97c8d424df9e02b5c94b5a95989f1c06a3f44c44a1cc83877af2ec4867aa74e')


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
