# Maintainer: tuxxx <nzb_tuxxx@proton.me>
pkgname=nzb-monkey-go-git
pkgver=0.1.17.r0.gd7c0cc6
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
makedepends=('git' 'go')
optdepends=('xdg-utils: register nzblink handler')
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-bin")
install=nzb-monkey-go.install
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nzb-monkey-go"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/nzb-monkey-go"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$srcdir/nzb-monkey-go"
  install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
}
