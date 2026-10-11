# Maintainer: Misaka 19465 <19465@misakanet.team>
# Thanks to the original maintainer zlicdt <xkicdt1@gmail.com>.

pkgname=open-orpheus-bin
pkgver=0.19.2
pkgrel=2
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
    '3bc4ae15190b462d5684398ec2d809af180c3237491f3069863318f0e1977089'
)
source_aarch64=(
    "${_upstream_pkgname}_${pkgver}-1_arm64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}-1_arm64.deb"
)
sha256sums_aarch64=(
    '32bed0fda746b7529a9f72e0b7b1065576e2b0a2b6b0ab9e527b2dfc100403b2'
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
