# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=goattracker
pkgver=2.73
pkgrel=1
pkgdesc="Crossplatform C64 music tracker. Included in this package are also the tools betaconv ins2snd2  mod2sng  sngspli2"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/goattracker2/"
license=('GPL')
depends=('sdl')
source=("${pkgname}-${pkgver}.zip::http://sourceforge.net/projects/goattracker2/files/GoatTracker%202/${pkgver}/GoatTracker_${pkgver}.zip/download")

prepare(){
	cd ${srcdir}/src
	sed -i -e "s/datafile/bme\/datafile/g" ${srcdir}/src/makefile.common
	sed -i -e "s/dat2inc/bme\/dat2inc/g" ${srcdir}/src/makefile.common
}

build(){
	cd "${srcdir}/src"
	cd bme
	make
	cd ..
	make
}

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/goattracker"
	
	install -D ${srcdir}/linux/{betaconv,goattrk2,ins2snd2,mod2sng,sngspli2} "${pkgdir}/usr/bin/"
	
	install -Dm644 "${srcdir}/goat_tracker_commands.pdf" "${pkgdir}/usr/share/goattracker/"
	install -d "${srcdir}/examples" "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "${srcdir}/readme.txt" "${pkgdir}/usr/share/goattracker/README"
}
md5sums=('4f765c03b8a8103f85585dcb9230ce1f')
