# Maintainer: czyt <czytcn@gmail.com>
pkgname=uniclipboard-bin
pkgver=0.10.0
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
sha256sums_x86_64=('c0a7e7740c89aab50803009b9f8748abd721ace1088413e743c8a036f3183761')
sha256sums_aarch64=('52079887e40eda0cc015aa1c4ac4f95a1c2f2e7e24daddb7e55504b789f64d70')

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
