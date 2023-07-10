# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=wg-cmd
pkgver=0.1.5
pkgrel=1
pkgdesc="TUI for managing WireGuard configuration files "
arch=(x86_64)
url="https://github.com/AndrianBdn/wg-cmd"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndrianBdn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('50894e7a6f00ceb64004d72493a8e6ac94b78d8504dcfbfed65c0521052e0de642850707ca089ccfddbcd48a3948f1dd1b85abfa4f7db3c2d7633c52284da105')


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
