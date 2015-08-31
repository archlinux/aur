# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=mandelbulber-opencl
pkgver=1.21
pkgrel=1
pkgdesc="3D application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems."
arch=('any')
url="http://mandelbulber.com/"
license=('GPL3')
depends=('libjpeg-turbo' 'ocl-icd' 'gtk2')
provides=('mandelbulber')
conflicts=('mandlebulber')
source=("${pkgname}::http://iweb.dl.sourceforge.net/project/mandelbulber/${pkgname}-${pkgver}-${pkgrel}.orig.tar.gz")
md5sums=('5215d76f72a74436f57fe944be538654')

build()
{
	cd ${pkgname}-${pkgver}-${pkgrel}.orig/makefiles
	make PREFIX=/usr all
}

package()
{
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/makefiles/mandelbulber-opencl" "${pkgdir}/usr/bin/"
	
	install -m755 -d "${pkgdir}/usr/share/mandelbulber"
	cp -ua "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig"/usr/share/* "${pkgdir}/usr/share/mandelbulber"
	
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/mandelbulber-opencl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

