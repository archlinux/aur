# Maintainer: JC Francois <jc[at]noirextreme[dotcom]>
pkgname=tiddlydesktop
pkgver=0.0.9
pkgrel=2
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')

arch=('x86_64')

source_x86_64=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v${pkgver}/tiddlydesktop-linux64-v${pkgver}.zip)
source=(tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums=('ec5826348934f45ba28209f00a96073876910aec3bc1bc5e7c6cc68216099998'
            'd0d6f6d515940ce2a232e3db07a10fe4bea135287d0f224676fb9d447b7103de')
sha256sums_x86_64=('6c3943ba24e5e56e447b3d73f2e93d22b19ee0412589c810a2022351fea7bc5b')

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
