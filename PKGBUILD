# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.2.0
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
sha256sums_x86_64=('d1584976c37f930a5c80b84355087659ea24d30b171d65a4bde0e5c3b2347d51')
sha256sums_aarch64=('43c1dff7601943ecfb7a6466afffe70079b786d27f181bf2500574d53cd2dac3')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
