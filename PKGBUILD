# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen
pkgver=0.0.7
pkgrel=2
pkgdesc='WireGuard vanity key generator'
arch=('any')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.11')
source=("${pkgname}-${pkgver}::https://github.com/axllent/wireguard-vanity-keygen/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d118a284f27a4ac67fcfd439975ef1429c7e2973e6d6d21763465b481fa19b57')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # this build process now mirrors the ci build process used by wireguard-vanity-keygen
    # after the project's makefile was deleted from wireguard-vanity-keygen in 0.0.7
    # https://github.com/axllent/wireguard-vanity-keygen/blob/0.0.7/.github/workflows/release-build.yml#L25-L37
    go build -ldflags "-w -X main.appVersion=${pkgver}" -o ${pkgname}
}

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
