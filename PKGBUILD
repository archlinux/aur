# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=cpu
pkgver=20220131
pkgrel=1
pkgdesc='cpu command in go, inspired by the Plan cpu command'
arch=('any')
license=('BSD')
makedepends=(git go)
url='https://github.com/u-root/cpu'
source=("git+$url#commit=a9019120c17be9337f7e41d0b90e6eedbc802753")
sha256sums=('SKIP')

prepare(){
  cd "$pkgname"
  mkdir -p build
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 build/cpu  "$pkgdir"/usr/bin/cpu
  install -Dm755 build/cpud "$pkgdir"/usr/bin/cpud
}
