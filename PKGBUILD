# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=drpcli
pkgver=3.6.0
pkgrel=1
pkgdesc="Command-line client for Digital Rebar Provision, an API-driven DHCP/PXE/TFTP provisioning system."
arch=('x86_64')
url="https://github.com/digitalrebar/provision"
license=('Apache')
provides=('drpcli')
optdepends=('jq: for parsing and syntax colouring JSON responses'
            'bash-completion: tab completion')
source=("dr-provision-${pkgver}.zip::https://github.com/digitalrebar/provision/releases/download/v${pkgver}/dr-provision.zip")
sha256sums=('f7a65dc67a2ecf460b7e21e8754fbd2c0485bea32db7d67c5ad651a647171924')

build() {
    mv ${srcdir}/bin/linux/amd64/drpcli ${srcdir}/
    ${srcdir}/drpcli autocomplete ${srcdir}/drpcli.definitions
}

package() {
    install -Dm755 "${srcdir}/drpcli" "${pkgdir}/usr/bin/drpcli"
    install -Dm644 "${srcdir}/drpcli.definitions" "${pkgdir}/usr/share/bash-completion/completions/drpcli"
}
