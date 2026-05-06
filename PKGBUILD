# Maintainer: Pablo <pablo@example.com>
pkgname=conga
pkgver=1.4.0
pkgrel=1
pkgdesc="Config generator CLI for Nginx, Docker Compose, WireGuard, Apache, and Caddy"
arch=('x86_64' 'aarch64')
url="https://github.com/pc0stas/conga"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -mod=vendor -ldflags "-X main.Version=v${pkgver}" -o conga .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 conga "${pkgdir}/usr/bin/conga"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
