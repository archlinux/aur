# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=tiddlydesktop
pkgver=0.0.13
pkgrel=1
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
depends=('gconf')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')

arch=('x86_64')

source_x86_64=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v${pkgver}/tiddlydesktop-linux64-v${pkgver}.zip)
source=(tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums=('ec5826348934f45ba28209f00a96073876910aec3bc1bc5e7c6cc68216099998'
            'd0d6f6d515940ce2a232e3db07a10fe4bea135287d0f224676fb9d447b7103de')
sha256sums_x86_64=('91eb42a282ff41c3571661a70cb6b8b0656e50a6bcf9be793ec0861d9435974a')

options=(!strip)

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r ${srcdir}/TiddlyDesktop-linux64-v${pkgver}/*  ${pkgdir}/usr/share/${pkgname}/
    # give mode 775 to subdirectories of /usr/share/tiddlydesktop
    find ${pkgdir}/usr/share/${pkgname}/ -type d -exec chmod 775 {} +

    install -Dm755 "${srcdir}/tiddlydesktop.sh"  "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/tiddlydesktop.desktop"  "${pkgdir}/usr/share/applications/tiddlydesktop.desktop"
    install -Dm644 "${srcdir}/TiddlyDesktop-linux64-v${pkgver}/images/Motovun Jack.svg"  "${pkgdir}/usr/share/pixmaps/tiddlydesktop.svg"

}
