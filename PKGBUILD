# Maintainer: shbernal <shbernal.01@gmail.com>
# Contributor: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=5.1.1
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery"
arch=('x86_64')
url="https://owasp.org/www-project-amass"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/owasp-amass/amass/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('431aaf204e98313bc1f30f9c5cb4a924c923a692c89d1cbe5b6fdc6b759a16dfc31b54abf2d482aba48dcbacc0539824a2a671bc0ac7f06fe3e7d807f55e64b8')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p bin
  CGO_ENABLED=0 go build -trimpath -o bin/amass ./cmd/amass
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/amass "${pkgdir}/usr/bin/amass"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
