# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=2.3.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('bd5e08dfbbb2ed4c1ba6c960365f34d916e913030e94d3f0515fedafa9a2c8bf')

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

