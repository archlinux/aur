# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.9.10_fix
_pkgver=${pkgver//_/-}
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
source=("pax-${pkgver}.tar.gz::https://github.com/froehlichA/pax/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('bd729af2bbf07151a2f48085cda4210434afa8101bb7ebc1f5aa603c28c238ba')

prepare() {
    echo "const currentPaxVersion*: string = \"v${_pkgver}\"" > "${srcdir}/pax-${_pkgver}/src/util/paxVersion.nim"
}

build() {
    cd "${srcdir}/pax-${_pkgver}"
    nimble build -d:release -y --nimbleDir:"${srcdir}/nimble"
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${_pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
