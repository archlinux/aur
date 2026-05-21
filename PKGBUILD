# Maintainer: unassignedthread <unassignedthread@github.com>
pkgname=fluxpass
pkgver=1.0.0
pkgrel=2
pkgdesc="GUI password manager for pass (passwordstore.org) with type-based entries"
arch=('any')
url="https://github.com/unassignedthread/FluxPass"
license=('MIT')
depends=('java-runtime>=17' 'pass' 'gnupg')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/FluxPass-${pkgver}"
    mvn package -q
}

package() {
    install -Dm755 "${srcdir}/FluxPass-${pkgver}/target/${pkgname}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

    install -Dm755 "${srcdir}/FluxPass-${pkgver}/fluxpass.sh" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/FluxPass-${pkgver}/fluxpass.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
