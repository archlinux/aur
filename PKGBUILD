# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.9.13
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
sha256sums=('5fea5f69c3e78140c34a0de4302f1a2cc31eca7a20b291ae9232f9b0aa507f99')

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
