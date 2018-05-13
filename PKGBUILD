# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=drpcli
pkgver=3.8.2
pkgrel=1
pkgdesc="Command-line client for Digital Rebar Provision, an API-driven DHCP/PXE/TFTP provisioning system."
arch=('x86_64')
url="https://github.com/digitalrebar/provision"
license=('Apache')
provides=('drpcli')
optdepends=('jq: for parsing and syntax colouring JSON responses'
            'bash-completion: tab completion')
source=("dr-provision-${pkgver}.zip::https://github.com/digitalrebar/provision/releases/download/v${pkgver}/dr-provision.zip")
sha256sums=('a11e2e9d56cac6505ed40887495be0136ffafb21faf18d0e5a597c5026a5ccd9')

build() {
    mv ${srcdir}/bin/linux/amd64/drpcli ${srcdir}/
    ${srcdir}/drpcli autocomplete ${srcdir}/drpcli.definitions
}

package() {
    install -Dm755 "${srcdir}/drpcli" "${pkgdir}/usr/bin/drpcli"
    install -Dm644 "${srcdir}/drpcli.definitions" "${pkgdir}/usr/share/bash-completion/completions/drpcli"
}
