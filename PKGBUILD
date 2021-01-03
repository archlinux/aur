# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=2.0.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('f554dc23c61683350e33b5843bbb05b3ac48eb8d1d9d3f70ee8e6335000a9f1b')

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

