# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=mandelbulber-opencl
pkgver=1.21
pkgrel=2
pkgdesc="3D application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems."
arch=('any')
url="http://mandelbulber.com/"
license=('GPL3')
depends=('libjpeg-turbo' 'ocl-icd' 'gtk2')
makedepends=('opencl-headers')
provides=('mandelbulber')
conflicts=('mandlebulber')
#source=("${pkgname}::http://iweb.dl.sourceforge.net/project/mandelbulber/${pkgname}-${pkgver}-${pkgrel}.orig.tar.gz")
source=("${pkgname}::https://sourceforge.net/projects/mandelbulber/files/mandelbulber-opencl-${pkgver}-${pkgrel}.orig.tar.gz/download"
	"fixWriteLog.diff")
md5sums=('d4dcb855aab3a5afe139dfcafb14ad72'
         '5f80e2fe5cad48fe33500c23440f602d')

prepare() {
	cd ${pkgname}-${pkgver}-${pkgrel}.orig
	patch -p1 < "$srcdir"/fixWriteLog.diff
}

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

