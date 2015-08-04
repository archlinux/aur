# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=mandelbulber2
pkgver=2.04
pkgrel=1
pkgdesc="3D application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems."
arch=('any')
url="https://github.com/buddhi1980/mandelbulber2"
license=('GPL3')
depends=('qt5-tools' 'libjpeg-turbo' 'libpng12' 'gsl' 'openmpi')
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}::https://github.com/buddhi1980/mandelbulber2/archive/2.04.tar.gz")
md5sums=('13fdeb5eadf9206b8c467248161414e5')

build()
{ 
	cd $pkgname-$pkgver/$pkgname/Release
	qmake-qt5 mandelbulber.pro
	make PREFIX=/usr
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"

	install -m755 -d "${pkgdir}/usr/bin"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/deploy/linux/mandelbulber2.desktop" "${pkgdir}/usr/share/applications/mandelbulber2.desktop"

	install -m755 -d "${pkgdir}/usr/share/mandelbulber"
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m755 -d "${pkgdir}/usr/share/icons"

	cp -ra "${srcdir}/${pkgname}-${pkgver}/${pkgname}/qt" "$pkgdir/usr/share/mandelbulber/qt"
	install -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/Release/mandelbulber2" "${pkgdir}/usr/bin/"
}
