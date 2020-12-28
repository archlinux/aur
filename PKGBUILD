# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=v1.2.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("$pkgname::git+https://github.com/Dundee/gdu")
sha256sums=('SKIP')

build() {
   cd $pkgname
   git checkout $pkgver
   export CGO_LDFLAGS="${LDFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
   go build -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}

