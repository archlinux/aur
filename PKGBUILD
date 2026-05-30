# Maintainer: artichoke <cmrtumilovic@gmail.com>
pkgname=chpwd
pkgver=1.2.1
pkgrel=1
pkgdesc="Secure CLI password manager using Argon2id and AES-256-GCM"
arch=('x86_64' 'aarch64')
url="https://github.com/b0lbas/chpwd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('907dad3f7ea99408f3e1a0edaaf680749f6a52d06184de234290bf7a314d41e2')

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
