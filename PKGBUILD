# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Universal package updater — parallel updates for Linux, BSD and Windows (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://radicle.network/nodes/iris.radicle.network/rad%3Az1SpYG13iEYC9Ds1UjyVJhe1sf1i"
license=('Unlicense')
provides=('bupdate')
conflicts=('bupdate' 'bupdate-git')
depends=()
options=(!debug)
optdepends=(
    'sudo: privilege elevation for system package managers'
    'systemd: sleep inhibition during updates'
)
_dlbase="https://codeberg.org/LAA/bupdate/releases/download/v${pkgver}"
source_x86_64=("bupdate-linux-amd64-${pkgver}::${_dlbase}/bupdate-linux-amd64")
source_aarch64=("bupdate-linux-arm64-${pkgver}::${_dlbase}/bupdate-linux-arm64")
sha256sums_x86_64=('936e6cae336b566773864fc99a14a956f8ea382dbfefdf0a4d56408830a7ff66')
sha256sums_aarch64=('f2e2fd06fa8fee93db42ee9a426ee3aba34178c084c94fbf4feeb3329e6f97bb')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
