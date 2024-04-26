# Maintainer: Luís Guimarães <obvionaoe@protonmail.com>

pkgname=rofi-browser
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple profile launcher for Mozilla Firefox-based browsers"
arch=('x86_64')
url="https://github.com/obvionaoe/rofi-browser/"
license=('MIT')
depends=(rofi)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(f705f00f33188f7c290b4eba5e6903177fae09a749dc77c6684b242b1dad6cc7)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -gcflags=all=-l
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DT README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
