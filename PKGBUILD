# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.9.9
pkgrel=1
pkgdesc="The MC modpack manager for professionals."
arch=('x86_64')
url="https://github.com/froehlicha/pax"
license=('MIT')
makedepends=('git' 'nim' 'nimble')
provides=('pax-mc')
conflicts=('pax-mc-bin' 'pax-mc-git')
replaces=()
changelog=
source=("pax-${pkgver}.tar.gz::https://github.com/froehlichA/pax/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c10f1d62fdadb9e6f252ad5a49b6d92e895abda92c7735b9fb1031042e0c887')

prepare() {
    echo "const currentPaxVersion*: string = \"v${pkgver}\"" > "${srcdir}/pax-${pkgver}/src/util/paxVersion.nim"
}

build() {
    cd "${srcdir}/pax-${pkgver}"
    nimble buildCI --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
