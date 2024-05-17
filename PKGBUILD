# Maintainer: Luís Guimarães <obvionaoe@protonmail.com>

pkgname=rofi-browser
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple profile launcher for Mozilla Firefox-based browsers"
arch=('x86_64')
url="https://github.com/obvionaoe/rofi-browser/"
license=('MIT')
depends=(rofi glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(8fb61f7d99ed71550356ad689c383caacb4b4325fd924f76d8d2dfab7bba446b)

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
