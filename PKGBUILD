# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.4.0
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
sha256sums_x86_64=('d87c2fbdce66837712113e504072cc335c14083faee84f6adddf9b6360605619')
sha256sums_aarch64=('67cfc2b1f88c1af44bd49847527709bd8baa571daad19d402aa02312185d0251')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
