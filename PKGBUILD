# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=3.0.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('9a1d14662a76265faab369a2a2bbe47429405bd8dee1d096d75822a1b27e1b15')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   export CGO_LDFLAGS="${LDFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
   go build -ldflags="-s -w -X 'main.AppVersion=$pkgver'" -o $pkgname .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}

