# Contributor: raininja < dandenkijin at gmail dot com >
# Maintainer: raininja < dandenkijin at gmail dot com >

pkgname=clipse
pkgver=0.0.71
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix."
arch=('any')
url="https://github.com/savedra1/clipse"
license=('GPL-3.0-or-later')
makedepends=(
  'go'
)
optdepends=(
  'xclip'
  'wl-clipboard'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ca061e01839ebad19819e23ba0986202bf33db329b8f40a222f401cde651583')

#prepare() {
#  cd "$pkgname-$pkgver"
#  mkdir -p build/
#}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  # export GOFLAGS="${GOFLAGS} $(pacman -T 'libalpm.so=14-64' > /dev/null && echo "-tags=next")"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
  #go build -o build ./cmd/...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

}
