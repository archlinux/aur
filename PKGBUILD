# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname=mbg
pkgver=1.4.0
pkgrel=1
pkgdesc="a game whose rules is a hybrid of 'monoply' and 'sanguo'"
arch=('x86_64')
url="https://gitee.com/tfcolin/mbg"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=('go>=1.20')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tfcolin/mbg/archive/refs/tags/v${pkgver}.tar.gz")

prepare() {
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

  go build -o build ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/mbg_gtk -t "$pkgdir"/usr/bin/
  install -Dm644 doc/manual.pdf -t "$pkgdir"/usr/share/doc/mbg/
}

sha256sums=('3473d99f2b4eda187d88271f89cf0067f1c0fda18bb9f31419faf13a2a3c71c8')
