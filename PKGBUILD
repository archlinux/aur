# Maintainer: Shameempk <mailtoshameempk@gmail.com>
pkgname=writefull
pkgver=3.0.0_beta12
pkgrel=1
pkgdesc="Writefull is an app that gives feedback on your writing by checking your text against databases of correct language."
arch=('i686' 'x86_64')
url="http://writefullapp.com/"
license=('custom')
source_i686=("https://d3aw1w08kaciwn.cloudfront.net/${pkgname}_${pkgver//_/-}_ia32.deb")
source_x86_64=("https://d3aw1w08kaciwn.cloudfront.net/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums_i686=("0536baaf9a8e3e70e6c5f5cc68bf3750")
md5sums_x86_64=("1268ec9d1053f5001712ec0dc081d635")

prepare() {
	tar -xf data.tar.gz --exclude=usr/share/ -C "${srcdir}"
}

package() {
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	
	cp -a "${srcdir}/usr/local/${pkgname}/." "${pkgdir}/usr/share/${pkgname}"
	
	ln -s "/usr/share/${pkgname}/Writefull" "${pkgdir}/usr/bin/writefull"
	
	install -Dm644 "${pkgdir}/usr/share/${pkgname}/Writefull.ico" "${pkgdir}/usr/share/pixmaps/writefull.ico"
	sed -i 's/Icon=.*$/Icon=\/usr\/share\/pixmaps\/writefull.ico/' "${pkgdir}/usr/share/${pkgname}/writefull.desktop"
	sed -i 's/Exec=.*$/Exec=writefull/' "${pkgdir}/usr/share/${pkgname}/writefull.desktop"
	install -Dm644 "${pkgdir}/usr/share/${pkgname}/writefull.desktop" "${pkgdir}/usr/share/applications/writefull.desktop"
	
	install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}