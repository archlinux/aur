# Maintainer: shbernal <shbernal.01@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=5.0.1
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('x86_64')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('af39b7ea789dd54c06a0da029d6ddf7d0dbebdc9aa6fbb22c6217629d9d6817ef73ad6030e4aba68887da667a792718aed74f2167045a2a6fbd27a530d0af44f')

build() {
  cd "amass-$pkgver"
  mkdir -p bin
  CGO_ENABLED=0 go build -trimpath -o bin/amass ./cmd/amass
}

package() {
  cd "amass-$pkgver"
  install -Dm755 bin/amass "${pkgdir}/usr/bin/amass"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
