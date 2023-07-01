# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=tiddlydesktop
pkgver=0.0.18
pkgrel=1
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
depends=('gconf' 'libxss')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')
arch=('x86_64')
options=(!strip)

source=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v${pkgver}/tiddlydesktop-linux64-v${pkgver}.zip
        https://github.com/Jermolene/TiddlyDesktop/archive/v${pkgver}.zip
        tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums=('851c9fcf20f07eaf161357ed940481e7d1d43af6ea8a51900e7b1b14d234d468'
            'e32de8c72f001d41a1b7f699a7a6ad7e3c16cbc0e48c8bf5ba5c0da6df554b80'
            '9f47a64b912a2ab3efc67a94559130c6d4e76a74b6a4a37c400972ef768b87e0'
            'a81adff1a65143c21a0b486ad6219ad493c75db53672bc229e08f0012c40b153')

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r ${srcdir}/TiddlyDesktop-linux64-v${pkgver}/*  ${pkgdir}/usr/share/${pkgname}/
    # give mode 644 to  in /usr/share/tiddlydesktop and subdirectories
    chmod 644 -R ${pkgdir}/usr/share/${pkgname}/
    # give mode 775 to subdirectories of /usr/share/tiddlydesktop
    find ${pkgdir}/usr/share/${pkgname}/ -type d -exec chmod 775 {} +
    # give 755 to executables
    chmod 755 ${pkgdir}/usr/share/${pkgname}/chromedriver
    chmod 755 ${pkgdir}/usr/share/${pkgname}/chrome_crashpad_handler
    chmod 755 ${pkgdir}/usr/share/${pkgname}/minidump_stackwalk
    chmod 755 ${pkgdir}/usr/share/${pkgname}/nacl_helper
    chmod 755 ${pkgdir}/usr/share/${pkgname}/nacl_helper_bootstrap
    chmod 755 ${pkgdir}/usr/share/${pkgname}/nacl_irt_x86_64.nexe
    chmod 755 ${pkgdir}/usr/share/${pkgname}/nw
    chmod 755 ${pkgdir}/usr/share/${pkgname}/nwjc

    install -Dm755 "${srcdir}/tiddlydesktop.sh"  "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/tiddlydesktop.desktop"  "${pkgdir}/usr/share/applications/tiddlydesktop.desktop"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon32.png"  "${pkgdir}/usr/share/icons/hicolor/32x32/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon48.png"  "${pkgdir}/usr/share/icons/hicolor/48x48/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon64.png"  "${pkgdir}/usr/share/icons/hicolor/64x64/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon128.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon256.png"  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon512.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tiddlydesktop.png"
    install -Dm644 "${srcdir}/TiddlyDesktop-${pkgver}/icons/app-icon1024.png"  "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/tiddlydesktop.png"
}
