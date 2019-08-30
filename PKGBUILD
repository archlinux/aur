# Maintainer: Mendel Greenberg <chabad 360 at gmail dot com>

pkgbase='citra-canary-bin'
pkgname=('citra-canary-bin' 'citra-qt-canary-bin')
pkgrel=1
pkgver=1459_20190823_281ef58
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
conflicts=('citra-git' 'citra-qt-git' 'citra-nightly-bin' 'citra-qt-nightly-bin' 'citra-bin' 'citra-qt' 'citra-canary-bin' 'citra-qt-canary-bin')
license=('GPL2')
arch=('x86_64')
url="https://citra-emu.org"

_canary_id=$(echo $pkgver | cut -d'_' -f1)
_ref="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"

source=("https://github.com/citra-emu/citra-canary/releases/download/canary-$_canary_id/citra-linux-$_ref.tar.xz"
        "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop")

sha256sums=('5580b06459ecc6345346b6fc87ba739a3f17d101577e1f7ee43e624757ebc6c0'
            '93bd8f799877eba7dd87ed7a4c29607d78c42b8769626c1d479f7e34fb7b39e2')

package_citra-canary-bin() {
    depends=('ffmpeg-compat-57' 'libsndio-61-compat' 'sdl2')
    provides=('citra')


    cd "${srcdir}/citra-linux-${_ref}"
    install -Dm755 -t "${pkgdir}/usr/bin" citra
    install -Dm755 -t "${pkgdir}/usr/bin" citra-room

}
package_citra-qt-canary-bin() {
    depends=('ffmpeg-compat-57' 'qt5-multimedia' 'libsndio-61-compat' 'sdl2' 'desktop-file-utils')
    optdepends=('libxkbcommon-x11: for X11 support'
	        'qt5-wayland: for Wayland support')
    provides=('citra-qt')


    cd "${srcdir}/citra-linux-${_ref}"
    install -Dm755 -t "${pkgdir}/usr/bin" citra-qt
    install -Dm755 -t "${pkgdir}/usr/bin" citra-room
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "dist/citra.png"

    cd "${srcdir}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "citra.desktop"
}
