# Maintainer: Misaka 19465 <19465@misakanet.team>
# Thanks to the original maintainer zlicdt <xkicdt1@gmail.com>.

pkgname=open-orpheus-bin
pkgver=0.17.0
pkgrel=1
_upstream_pkgname=open-orpheus
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host."
arch=('x86_64')
url="https://github.com/YUCLing/open-orpheus"
license=('MIT')
depends=(
    'alsa-lib'
    'gtk3'
    'libnotify'
    'nss'
    'xdg-utils'
    'at-spi2-core'
    'libdrm'
    'mesa'
    'libxcb'
)
makedepends=('libarchive')
provides=("${_upstream_pkgname}=${pkgver}")
conflicts=("${_upstream_pkgname}")
source=(
    "${_upstream_pkgname}_${pkgver}-1_amd64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}-1_amd64.deb"
    "LICENSE"
)
sha256sums=(
    'af1a704bcbb3f1a5288b343d0120d5f512d1dc378723c7a6915743852efee69a'
    '4499595d653b7a9e65001bb09239e6fb5d33e650d1f9db808ce87905021e9ff8'
)

prepare() {
    ar x "${srcdir}/${_upstream_pkgname}_${pkgver}-1_amd64.deb"
}

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --no-same-owner
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
