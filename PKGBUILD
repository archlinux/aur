# Maintainer: artichoke <cmrtumilovic@gmail.com>
pkgname=chpwd
pkgver=1.1.1
pkgrel=1
pkgdesc="Secure CLI password manager using Argon2id and AES-256-GCM"
arch=('x86_64' 'aarch64')
url="https://github.com/b0lbas/chpwd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6b97cdc0aac52950a2a3d57a4211c99dda6cb1c48a667a901b4c21cefe3ca286')

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
