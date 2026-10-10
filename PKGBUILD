# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-launch
pkgver=0.2.0
pkgrel=1
pkgdesc="Application discovery and launcher diagnostic CLI for Niri"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-launch"
license=('GPL-3.0-only')
depends=('niri')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-launch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95d2a38481ba71c6c65f54e7cc1224ef9912137e74f352710d2f48e504a5e6ca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=0
  go build -buildvcs=false -o "${pkgname}" "./cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
