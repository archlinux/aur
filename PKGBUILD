# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.9.14
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
sha256sums=('b499af45c1e1f70f20d067d009bfd5b656f0b4430694973990e9fdb2003c5cac')

prepare() {
    echo "const currentPaxVersion*: string = \"v${pkgver}\"" > "${srcdir}/pax-${pkgver}/src/util/paxVersion.nim"
}

build() {
    cd "${srcdir}/pax-${pkgver}"
    nimble build -d:release -y --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
