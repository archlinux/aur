# Maintainer: artichoke <cmrtumilovic@gmail.com>
pkgname=chpwd
pkgver=1.1.0
pkgrel=1
pkgdesc="Secure CLI password manager using Argon2id and AES-256-GCM"
arch=('x86_64' 'aarch64')
url="https://github.com/b0lbas/chpwd"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b2ee178f12c3e535d00b521931ae82036e02e05159059c75fd2b7a840ffd4bbc')

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
