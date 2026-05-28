# Maintainer: artichoke <cmrtumilovic@gmail.com>
pkgname=chpwd
pkgver=1.0.2
pkgrel=1
pkgdesc="Secure CLI password manager using Argon2id and AES-256-GCM"
arch=('x86_64' 'aarch64')
url="https://github.com/b0lbas/chpwd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c90f930426ece4caec6583b0d780a2d714632d38cbc7d66636492ff86439f20a')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -o "${pkgname}" main.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
