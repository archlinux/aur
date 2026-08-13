# Maintainer: gonwe <gonwex@gmail.com>
pkgname=doubao-desktop-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Unofficial Doubao desktop wrapper for Linux, built with Tauri"
arch=('x86_64')
url="https://github.com/gonwe/doubao-desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib2' 'libgl' 'hicolor-icon-theme')
makedepends=()
optdepends=('noto-fonts-cjk: CJK system font' 'adobe-source-han-sans-cn-fonts: CJK system font')
provides=("doubao-desktop=${pkgver}")
conflicts=('doubao-desktop')

_dlname="doubao-desktop-${pkgver}-x86_64.tar.gz"
source=("${_dlname}::https://github.com/gonwe/doubao-desktop/releases/download/v${pkgver}/${_dlname}"
        "${pkgname}.desktop")
sha256sums=('427d249754d76069d748e11c0e3089e0c3abc26d3c782353b94c350c19aecbaf'
            'SKIP')

package() {
    cd "$srcdir"
    _srcdir="doubao-desktop-${pkgver}-x86_64"

    install -Dm755 "${_srcdir}/doubao-desktop" "$pkgdir/usr/bin/doubao-desktop"
    install -Dm755 "${_srcdir}/doubao-desktop.bin" "$pkgdir/usr/bin/doubao-desktop.bin"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/doubao-desktop.desktop"

    # Multiple icon sizes for all DEs/panels
    for size in 48 64 128 256; do
        install -Dm644 "${_srcdir}/${size}x${size}/doubao-desktop.png"             "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/doubao-desktop.png"
    done
}
