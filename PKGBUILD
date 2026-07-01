# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=kanarenshu
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimal TUI application to practise Japanese from the terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/nuixyz/kanarenshu"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nuixyz/kanarenshu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3565f7ac42a355d145b35427203f22036f20126974f8269e570fa48bdcd9dd3d')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o "$pkgname" ./cmd/kanarenshu
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  fi
}
