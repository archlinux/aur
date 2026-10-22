# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.2.3
pkgrel=2
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
sha256sums_x86_64=('7685b611674438be4bfeb3171bbd5cc771d8842993e925d5057261562174161a')
sha256sums_aarch64=('800b6ac75af683b8a82415ffea268c02e497043a01af3e0a436d2782fee787a9')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
