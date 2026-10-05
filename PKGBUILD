# Maintainer: czyt <czytcn@gmail.com>
pkgname=uniclipboard-bin
pkgver=1.1.1
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
sha256sums_x86_64=('7ef991a722d3ca5de046f37ae221e8d5901929f7843a9cab7fce641be8b8cfee')
sha256sums_aarch64=('62350b30ad23e8deb12664a894969404a6c8f7b13208c875ebb2745598ce750c')

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
