# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=ketm
pkgdesc="kill everything that moves"
pkgver=0.0.6
pkgrel=2
license=("GPL")
url=("http://ketm-gg.sf.net")
depends=(sdl)
arch=('i686' 'x86_64')
source=("ftp://ftp.debian.org/debian/pool/main/k/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
	"ftp://ftp.debian.org/debian/pool/main/k/${pkgname}/${pkgname}_${pkgver}-22.diff.gz")
sha512sums=('30f83911bae02fe48ab288c209b8d18457542c222b60f7a973fe4e3128ceb654b62a495de97453c524c17f4aa43b5210889488a22ab25f8828cdb251a940da24'
            '0629e88f86a9fa2a7d6a1a68e8da3329fd8ec275bda465ba8d044e9191e9bab6888f82a6cfee5264341610155a81cb42f8be663e82c08227840742ee5d485e1d')

build(){
	cd ${srcdir}/
	patch -p0 -i ${pkgname}_${pkgver}-22.diff
	cd ${pkgname}-${pkgver}/
	for patch in ./debian/patches/*diff; do 
		count=1
		patch -p$count -i $patch
		count=count+1
	done
	sh configure --prefix=/usr --with-x --disable-sdltest
	make
}

package(){
	cd ${srcdir}/${pkgname}-${pkgver}/
	make DESTDIR=${pkgdir} install
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/icons/
	cp ${srcdir}/${pkgname}-${pkgver}/debian/${pkgname}.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/${pkgname}-${pkgver}/debian/${pkgname}.xpm ${pkgdir}/usr/share/icons/
}
