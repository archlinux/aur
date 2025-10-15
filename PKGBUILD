# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=hexecute
pkgver=0.2.0
pkgrel=1
pkgdesc="Launch apps by casting spells!"
arch=('x86_64' 'aarch64')
url="https://github.com/ThatOtherAndrew/Hexecute"
options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'git'
  'wayland'
  'wayland-protocols'
)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ThatOtherAndrew/Hexecute/archive/v${pkgver}.tar.gz")
sha256sums=('0616819284e1f4ee23b5901d30896dd4453a9240cc555874d5f4420293069481')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/Hexecute-$pkgver"
  mkdir bin || true
  go build -o bin ./...
}

package() {
  cd "$srcdir/Hexecute-$pkgver"
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
