# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=tiddlydesktop
pkgver=0.0.22
pkgrel=1
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis"
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

sha256sums=('fe221e77ecd6fc7d5c93a2475b3c47b06b3e6d37435bbdcfd60bf4a59e90424a'
            '6e1188c12bfcfa02c89236258105bad1d42653d52aa5c2bba13241ffc154b964'
            '9f47a64b912a2ab3efc67a94559130c6d4e76a74b6a4a37c400972ef768b87e0'
            '10086a0f3e65e8276cd6d80be940c623adf049f8fd21dcf12c397703e4521193')

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
