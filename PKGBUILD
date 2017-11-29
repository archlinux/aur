# Maintainer: JC Francois <jc[at]noirextreme[dotcom]>
pkgname=tiddlydesktop
pkgver=0.0.9
pkgrel=1
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')

arch=('x86_64')

source_x86_64=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v0.0.9/tiddlydesktop-linux64-v0.0.9.zip)
source=(tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums=('ec5826348934f45ba28209f00a96073876910aec3bc1bc5e7c6cc68216099998'
            '58481ee296f39ac95760fffc947bf36c3ccbea73bdcde7d224102109e90cd0de')
sha256sums_x86_64=('6c3943ba24e5e56e447b3d73f2e93d22b19ee0412589c810a2022351fea7bc5b')

package() {
	cd "$srcdir"
	install -d "${pkgdir}/usr/share/${pkgname}"

	# Since tiddlydesktop is zipped in a subfolder
	tdir=`find ${srcdir} -type d -name TiddlyDesktop-linux*`
	cp -r ${tdir}/* .

	# Remove unneccesary files
	rm ${srcdir}/*.zip
	rm -rf ${tdir}

	cp -r . "${pkgdir}/usr/share/$pkgname"
	chmod -R 775 "${pkgdir}/usr/share/$pkgname"

    install -Dm755 "tiddlydesktop.sh"                   "${pkgdir}/usr/bin/$pkgname"

    install -Dm644 "${srcdir}/tiddlydesktop.desktop"    "${pkgdir}/usr/share/applications/tiddlydesktop.desktop"
    install -Dm644 "${srcdir}/images/Motovun Jack.svg"  "${pkgdir}/usr/share/pixmaps/tiddlydesktop.svg"
}
