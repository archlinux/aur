# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=mandelbulber-opencl
pkgver=1.21
pkgrel=2
pkgdesc="3D application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems."
arch=('any')
url="http://mandelbulber.com/"
license=('GPL3')
depends=('libjpeg-turbo' 'ocl-icd' 'gtk2' 'oclp')
provides=('mandelbulber')
conflicts=('mandlebulber')
source=("${pkgname}::http://iweb.dl.sourceforge.net/project/mandelbulber/${pkgname}-${pkgver}-${pkgrel}.orig.tar.gz")
md5sums=('d4dcb855aab3a5afe139dfcafb14ad72')

build()
{
	cd ${pkgname}-${pkgver}-${pkgrel}.orig/makefiles
	make PREFIX=/usr all
}

package()
{
	install -m755 -d "${pkgdir}/usr/bin"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/mandelbulber-opencl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -m755 -d "${pkgdir}/usr/share/${pkgname}"
	install -m755 -d "${pkgdir}/usr/share/cl"
	install -m755 -d "${pkgdir}/usr/share/exampleKeyframes"
	install -m755 -d "${pkgdir}/usr/share/exampleOCLformulas"
	install -m755 -d "${pkgdir}/usr/share/examples"
	install -m755 -d "${pkgdir}/usr/share/icons"
	install -m755 -d "${pkgdir}/usr/share/textures"

	cp -ra "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/usr/share/cl" "${pkgdir}/usr/share/cl"
	cp -ra "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/usr/share/exampleKeyframes" "${pkgdir}/usr/share/exampleKeyframes"
	cp -ra "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/usr/share/exampleOCLformulas" "${pkgdir}/usr/share/exampleOCLformulas"
	cp -ra "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/usr/share/examples" "${pkgdir}/usr/share/examples"
	cp -ra "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/usr/share/icons" "${pkgdir}/usr/share/icons"
	cp -ra "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/usr/share/textures" "${pkgdir}/usr/share/textures"
	install -m755 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.orig/mandelbulber-opencl" "${pkgdir}/usr/bin/"
}

