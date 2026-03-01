# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Universal package updater — parallel updates for Linux, BSD and Windows (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/iris.radicle.xyz/rad:z1SpYG13iEYC9Ds1UjyVJhe1sf1i"
license=('custom:ANTL-2.0')
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
sha256sums_x86_64=('e7a1267ce0792e6599a022576538300c9154dcedd1b55f42923dfc87a2f6883a')
sha256sums_aarch64=('e1c513f6bf93c7b548c2dfd4ba4fd4d333f7f29eaa2470acd10e32c146c3b26d')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
