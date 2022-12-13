# Maintainer: UmamiAppearance <mail@umamiappearance.eu>

pkgname=ecoji
pkgver=2.0.1+5+g805d064
pkgrel=4
pkgdesc="Encode or decode data as Unicode emojis."
arch=("x86_64")
url="https://github.com/keith-turner/ecoji"
license=("Apache")
makedepends=(git go)
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --tags | sed "s/^v//;s/-/+/g"
}

prepare() {
  cd $pkgname
  mkdir -p build/
}

build() {
  cd "$pkgname"/cmd
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ../build ./ecoji.go
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
