# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: Gabriel Ortega <coffelius@gmail.com>

pkgname=rofi-code
pkgdesc="Use rofi to quickly open Visual Studio Code or Codium workspaces."
pkgver=0.2
pkgrel=1
arch=('x86_64')
url="https://www.github.com/Coffelius/rofi-code"
license=('MIT')
depends=(rofi)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b9cec4decfbc6e36493460d6f28c23cd9c01d173b0a91ac0e49a32255e335991')

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
  install -DT rofi-code "${pkgdir}/usr/bin/rofi-code"
  install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DT README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
