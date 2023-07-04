# Maintainer: Mendel Greenberg <mendel at chabad360 dot me>

pkgbase='citra-canary-bin'
pkgname=('citra-canary-bin' 'citra-qt-canary-bin')
pkgrel=1
pkgver=2485_20230516_391fbec
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
license=('GPL2')
arch=('x86_64')
url="https://citra-emu.org"

_canary_id=$(echo $pkgver | cut -d'_' -f1)
_ref="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"

source=("https://github.com/citra-emu/citra-canary/releases/download/canary-$_canary_id/citra-linux-$_ref.tar.xz"
        "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop")

sha256sums=('d4efc831b46fe46737cee5f22564702bf0e7c5e68a2fcc0ebf6153e002f8c977'
            '427e450b7f54c1a764eb96d109b45e67cbc8003bdca379cef7df7652ed539526')

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
