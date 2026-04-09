# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=wg-cmd
pkgver=0.1.7
pkgrel=1
pkgdesc="TUI for managing WireGuard configuration files "
arch=(x86_64)
url="https://github.com/AndrianBdn/wg-cmd"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndrianBdn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a7841862d25f2ac5815e3d0de5a2fc75bb4ff06ee47a8b030419feee5f946aa49552ef1830e75b713acd7a4d72d89d128d545d9d03d471a0281e47a2a0c73431')


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
