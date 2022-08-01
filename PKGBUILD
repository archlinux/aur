Maintainer="baris-inandi"
pkgname=fe
pkgver=1.0.13
pkgrel=1
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPL3')
depends=(bash sudo paru)
makedepends=(git go)
source=("git+$url")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname-$pkgver-$pkgrel"
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname-$pkgver-$pkgrel" "$pkgdir"/usr/bin/$pkgname
}
