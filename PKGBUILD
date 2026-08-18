# Maintainer: Misaka 19465 <19465@misakanet.team>
# Thanks to the original maintainer zlicdt <xkicdt1@gmail.com>.

pkgname=open-orpheus-bin
pkgver=0.16.2
pkgrel=2
_upstream_pkgname=open-orpheus
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host."
arch=('x86_64')
url="https://github.com/YUCLing/open-orpheus"
license=('MIT')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'xdg-utils'
    'at-spi2-core'
    'libdrm'
    'mesa'
    'libxcb'
)
optdepends=('kde-cli-tools: enable trash integration')
makedepends=('libarchive')
provides=("${_upstream_pkgname}=${pkgver}")
conflicts=("${_upstream_pkgname}")
source=(
    "${_upstream_pkgname}_${pkgver}_amd64.deb::https://github.com/YUCLing/open-orpheus/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}_amd64.deb"
    "LICENSE"
)
sha256sums=(
    'd91aa12916a86da1f6fa0d2f0a2c4a219c7dc9463591493b3d6c30a473fa15dd'
    '4499595d653b7a9e65001bb09239e6fb5d33e650d1f9db808ce87905021e9ff8'
)

prepare() {
    ar x "${srcdir}/${_upstream_pkgname}_${pkgver}_amd64.deb"
}

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --no-same-owner
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
