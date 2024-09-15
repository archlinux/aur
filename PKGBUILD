# Maintainer: Hao Long <aur@esd.cc>

pkgname=terminal-to-html
pkgver=3.16.2
pkgrel=1
pkgdesc="Converts arbitrary shell output (with ANSI) into beautifully rendered HTML"
arch=("x86_64" "i686")
url="https://github.com/buildkite/terminal-to-html"
license=('MIT')
provides=('terminal-to-html')
conflicts=('terminal-to-html')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('3cba018e1314b8b0c3bb4f8dfa98fbca815f6edc6a30994fd320543b3d3eedbbdc57cf1fb44361bf99d578e684cd38d130b23ce58b70b4c93a116d9e79f9863c')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
