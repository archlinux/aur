# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=git-chglog
pkgver=0.15.4
pkgrel=1
pkgdesc='git CHANGELOG generator'
url="https://github.com/git-chglog/git-chglog"
arch=(x86_64)
license=(MIT)
depends=(git)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/git-chglog/git-chglog/archive/v${pkgver}.tar.gz)
sha512sums=('753b14567348435ca9a3c469a470fad45b2be11f57d407f14af260b5895ca948ce8c39a6793dee8cf9490dfcc6ebc18e2d61b3ba7d8c8c333cbbf1568b2a6276')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname} ./cmd/git-chglog
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
