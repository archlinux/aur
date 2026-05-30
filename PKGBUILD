# Maintainer: artichoke <cmrtumilovic@gmail.com>
pkgname=chpwd
pkgver=1.1.2
pkgrel=1
pkgdesc="Secure CLI password manager using Argon2id and AES-256-GCM"
arch=('x86_64' 'aarch64')
url="https://github.com/b0lbas/chpwd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('43b1c6500ba8bf31291ec3a9b0ddf11b2e02ecef7050eb9c531751abb3fa4746')

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
