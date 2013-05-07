# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=goattracker
pkgver=2.72
pkgrel=2
pkgdesc="Crossplatform C64 music tracker. Included in this package are also the tools betaconv ins2snd2  mod2sng  sngspli2"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/goattracker2/"
license=('GPL')
depends=('sdl')
source=("${pkgname}-${pkgver}.zip::http://sourceforge.net/projects/goattracker2/files/GoatTracker%202/${pkgver}/GoatTracker_${pkgver}.zip/download")
md5sums=('5f4b330cf74aa7293286165eac6315c7')

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
