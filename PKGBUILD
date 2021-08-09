# Maintainer: Mendel Greenberg <mendel at chabad 360 dot me>

pkgbase='citra-bin'
pkgname=('citra-bin' 'citra-qt-bin')
pkgrel=1
pkgver=1720_20210801_c40871f
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
conflicts=('citra-git' 'citra-qt-git' 'citra-canary-bin' 'citra-qt-canary-bin')
license=('GPL2')
arch=('x86_64')
url="https://citra-emu.org"

_nightly_id=$(echo $pkgver | cut -d'_' -f1)
_ref="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"

source=("https://github.com/citra-emu/citra-nightly/releases/download/nightly-$_nightly_id/citra-linux-$_ref.tar.xz"
        "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop")

sha256sums=('cda618f525fde86358b33c24c2ef65b929ff9f414b4d2bef2bb4e38c87a3a188'
            'b4c9433fbcbb1b9ddf19f009252e89d8d653ebac7f67d5d0beb49259f583ab69')

package_citra-bin() {
    depends=('ffmpeg-compat-57' 'libsndio-61-compat' 'sdl2')
    replaces=('citra-nightly-bin')
    conflicts+=( 'citra-qt-bin' )

    cd "${srcdir}/citra-linux-${_ref}"
    install -Dm755 -t "${pkgdir}/usr/bin" citra
    install -Dm755 -t "${pkgdir}/usr/bin" citra-room

}
package_citra-qt-bin() {
    depends=('ffmpeg-compat-57' 'qt5-multimedia' 'libsndio-61-compat' 'sdl2' 'desktop-file-utils')
    optdepends=('libxkbcommon-x11: for X11 support'
	        'qt5-wayland: for Wayland support')
    replaces=('citra-qt' 'citra-qt-nightly-bin')
    conflicts+=( 'citra-bin' )

    cd "${srcdir}/citra-linux-${_ref}"
    install -Dm755 -t "${pkgdir}/usr/bin" citra-qt
    install -Dm755 -t "${pkgdir}/usr/bin" citra-room
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "dist/citra.png"

    cd "${srcdir}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "citra.desktop"
}
