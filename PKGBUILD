# Maintainer: Spreagtha <spreagtha at  mykolab dot com>
# Contributor: Vasket <vasket at  dismail dot de>

pkgname="brig"
pkgver="0.4.1"
pkgrel="2"
pkgdesc="File synchronization on top of ipfs with git like interface and web based UI"
arch=(x86_64 i686 armv7h aarch64)
license=("AGPLv3")
url="https://github.com/sahib/${pkgname}"
depends=(go)
provides=("brig")
conflicts=("brig-git")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sahib/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    GOBIN_OLD=$GOBIN
    GOBIN="${srcdir}/${pkgname}-${pkgver}"
    go mod vendor
    go run mage.go b
    GOBIN=$GOBIN_OLD
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
