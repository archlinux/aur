# Maintainer: Misaka 19465 <19465@misakanet.team>
# Thanks to the original maintainer zlicdt <xkicdt1@gmail.com>.

pkgname=open-orpheus-bin
pkgver=0.20.0
pkgrel=1
_upstream_pkgname=open-orpheus
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host."
arch=('x86_64' 'aarch64')
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
    "LICENSE"
)
sha256sums=(
    '4499595d653b7a9e65001bb09239e6fb5d33e650d1f9db808ce87905021e9ff8'
)
# Upstream publishes Debian packages named with Debian architecture names.
source_x86_64=(
    "${_upstream_pkgname}_${pkgver}-1_amd64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}-1_amd64.deb"
)
sha256sums_x86_64=(
    '45b46d2f8a585cc10bd0aae62fef8265f15a4f9d670f396187a2e73ad12793cd'
)
source_aarch64=(
    "${_upstream_pkgname}_${pkgver}-1_arm64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}-1_arm64.deb"
)
sha256sums_aarch64=(
    'f6a1eed8ba5fdc40e76c0b38ba431a6ba732eb354e794cf81036914a37d47187'
)

case "${CARCH}" in
    x86_64) _debarch=amd64 ;;
    aarch64) _debarch=arm64 ;;
esac

prepare() {
    ar x "${srcdir}/${_upstream_pkgname}_${pkgver}-1_${_debarch}.deb"
}

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --no-same-owner
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
