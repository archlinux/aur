# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=drpcli
pkgver=3.0.5
pkgrel=2
pkgdesc="Command-line client for Digital Rebar Provision, an API-driven DHCP/PXE/TFTP provisioning system."
arch=('i686' 'x86_64')
url="https://github.com/digitalrebar/provision"
license=('Apache')
provides=('drpcli')
makedepends=('unzip')
optdepends=('jq: for parsing and syntax colouring JSON responses'
            'bash-completion: tab completion')
source=("https://github.com/digitalrebar/provision/releases/download/v${pkgver}/dr-provision.zip")
sha256sums=('d6b62678cfcde47029fab67d67b1fbfcc7725fcb364536ac636d861f77abbde2')

build() {
    if [ "${CARCH}" == "i686" ]; then _arch="386"; else _arch="amd64"; fi
    mv ${srcdir}/bin/linux/${_arch}/drpcli ${srcdir}/
    ${srcdir}/drpcli autocomplete ${srcdir}/drpcli.definitions
}

package() {
    install -Dm755 "${srcdir}/drpcli" "${pkgdir}/usr/bin/drpcli"
    install -Dm644 "${srcdir}/drpcli.definitions" "${pkgdir}/usr/share/bash-completion/completions/drpcli"
}
