# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Universal package updater — parallel updates for Linux, BSD and Windows (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/iris.radicle.xyz/rad:z1SpYG13iEYC9Ds1UjyVJhe1sf1i"
license=('custom:ANTL-2.0')
provides=('bupdate')
conflicts=('bupdate' 'bupdate-git')
depends=()
optdepends=(
    'sudo: privilege elevation for system package managers'
    'systemd: sleep inhibition during updates'
)
_dlbase="https://codeberg.org/LAA/bupdate/releases/download/v${pkgver}"
source_x86_64=("bupdate-linux-amd64-${pkgver}::${_dlbase}/bupdate-linux-amd64")
source_aarch64=("bupdate-linux-arm64-${pkgver}::${_dlbase}/bupdate-linux-arm64")
sha256sums_x86_64=('c5d34f70a908cd930204a63884201f7bc50ed6834e0021e8534ae5c96c869371')
sha256sums_aarch64=('ad946006c84c63124a7b18a1174c5044be1410464c55a166185767f636afed84')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
