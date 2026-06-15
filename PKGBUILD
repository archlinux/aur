# Maintainer: czyt <czytcn@gmail.com>
pkgname=uniclipboard-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Real-time clipboard sync across macOS, Windows and Linux — local-first, peer-to-peer, and end-to-end encrypted"
arch=('x86_64' 'aarch64')
url="https://www.uniclipboard.app"
license=('AGPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('uniclipboard')
conflicts=('uniclipboard')
source_x86_64=("uniclipboard_${pkgver}_amd64.deb::https://github.com/UniClipboard/UniClipboard/releases/download/v${pkgver}/UniClipboard_${pkgver}_amd64.deb")
source_aarch64=("uniclipboard_${pkgver}_arm64.deb::https://github.com/UniClipboard/UniClipboard/releases/download/v${pkgver}/UniClipboard_${pkgver}_arm64.deb")
sha256sums_x86_64=('6d4e35dfb6cbebab096592a6297ed519f83c0f5591da127881c12152f75a3802')
sha256sums_aarch64=('0eb8c8bc8cfeeda4ef38d7f9c796fa9da184ee0ec1fea8e5df70a3ca942e04aa')

package() {
    local _debfile
    if [[ "$CARCH" == "x86_64" ]]; then
        _debfile="uniclipboard_${pkgver}_amd64.deb"
    else
        _debfile="uniclipboard_${pkgver}_arm64.deb"
    fi

    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
