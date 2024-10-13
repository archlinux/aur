# Contributor: raininja < dandenkijin at gmail dot com >
# Maintainer: raininja < dandenkijin at gmail dot com >

pkgname=clipse
pkgver=1.1.0
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
sha256sums=('a265b16505ef6ab45259d2daf8fbb4b13f18c8231a7deb70b08936fce759c29e')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

}
