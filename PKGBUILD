# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=mandelbulber2
pkgver=2.10
_pkgver_orig=2.10
pkgrel=1
pkgdesc="3D application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems."
arch=('x86_64' 'i686')
url="https://github.com/buddhi1980/mandelbulber2"
license=('GPL3')
depends=('qt5-tools' 'libjpeg-turbo' 'libpng12' 'gsl' 'openmpi')
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}::https://github.com/buddhi1980/mandelbulber2/archive/2.10.tar.gz")
sha256sums=('b4032ba0b40a8977a9230be5fd7846b45e15d6450f6c7f434213975bb270ed49')

build()
{
	cd $pkgname-$_pkgver_orig/$pkgname/Release
	qmake-qt5 mandelbulber.pro
	make PREFIX=/usr
}

package()
{
	cd "$srcdir/$pkgname-$_pkgver_orig"

	install -m755 -d "${pkgdir}/usr/bin"
	install -D -m644 "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/deploy/linux/mandelbulber2.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -m755 -d "${pkgdir}/usr/share/${pkgname}"
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m755 -d "${pkgdir}/usr/share/icons"

	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/data" "$pkgdir/usr/share/${pkgname}/data"
	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/deploy/share/mandelbulber2/examples" "$pkgdir/usr/share/${pkgname}/examples"
	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/deploy/share/mandelbulber2/icons" "$pkgdir/usr/share/${pkgname}/icons"
	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/language" "$pkgdir/usr/share/${pkgname}/language"
	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/qt_data" "$pkgdir/usr/share/${pkgname}/qt_data"
	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/deploy/share/mandelbulber2/textures" "$pkgdir/usr/share/${pkgname}/textures"
	cp -ra "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/deploy/share/mandelbulber2/toolbar" "$pkgdir/usr/share/${pkgname}/toolbar"
	install -m755 "${srcdir}/${pkgname}-${_pkgver_orig}/${pkgname}/Release/mandelbulber2" "${pkgdir}/usr/bin/"
}
