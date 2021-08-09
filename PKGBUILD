# Maintainer: Mendel Greenberg <mendel at chabad360 dot me>

pkgbase='citra-canary-bin'
pkgname=('citra-canary-bin' 'citra-qt-canary-bin')
pkgrel=1
pkgver=1984_20210809_1bc889a
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
license=('GPL2')
arch=('x86_64')
url="https://citra-emu.org"

_canary_id=$(echo $pkgver | cut -d'_' -f1)
_ref="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"

source=("https://github.com/citra-emu/citra-canary/releases/download/canary-$_canary_id/citra-linux-$_ref.tar.xz"
        "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop")

sha256sums=('802e6ad1a1f6ab81b508e3608eae03ceaee9380fe3bb9004b3adbfc856358639'
            'b4c9433fbcbb1b9ddf19f009252e89d8d653ebac7f67d5d0beb49259f583ab69')

package_citra-canary-bin() {
    depends=('ffmpeg-compat-57' 'libsndio-61-compat' 'sdl2')
    conflicts=('citra-git' 'citra-nightly-bin' 'citra-bin')


    cd "${srcdir}/citra-linux-${_ref}"
    install -Dm755 -t "${pkgdir}/usr/bin" citra
    install -Dm755 -t "${pkgdir}/usr/bin" citra-room

}
package_citra-qt-canary-bin() {
    depends=('ffmpeg-compat-57' 'qt5-multimedia' 'libsndio-61-compat' 'sdl2' 'desktop-file-utils')
    optdepends=('libxkbcommon-x11: for X11 support'
	        'qt5-wayland: for Wayland support')
    conflicts=('citra-qt-git' 'citra-qt-nightly-bin' 'citra-qt')


    cd "${srcdir}/citra-linux-${_ref}"
    install -Dm755 -t "${pkgdir}/usr/bin" citra-qt
    install -Dm755 -t "${pkgdir}/usr/bin" citra-room
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "dist/citra.png"

    cd "${srcdir}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "citra.desktop"
}
