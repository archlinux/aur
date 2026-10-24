# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.4.1
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
sha256sums_x86_64=('c0ce865bde39487b6c201edabe480318f6799958c57964f652b06f3dcb108afc')
sha256sums_aarch64=('e4626f530c7002e2d1172cccefd4e1ef1c92e1d3d23c86beed688c54faeda7ee')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
