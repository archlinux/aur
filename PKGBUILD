# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=sgn
pkgver=2.0
pkgrel=1
pkgdesc='Polymorphic binary encoder'
arch=('x86_64')
url='https://github.com/EgeBalci/sgn'
license=('MIT')
makedepends=('go' 'keystone')
source=("https://github.com/EgeBalci/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('bc788d8d03df2c04996b5f2a44fe2b99629cd434a11e6de9db4dbc24b0059cbeb06a77347ca6338473a91bce9b6a1b912f00df9d94f4ce536490010dbb77befb')

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
  go build -o build/ .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
