# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.9.10
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
sha256sums=('f459c3dd326f1a73e6d7c63246aae2c310cc9777d83853cb69ee33e8294b2508')

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
