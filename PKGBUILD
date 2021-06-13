# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=ketm
pkgdesc="kill everything that moves"
pkgver=0.0.6
pkgrel=3
license=("GPL")
url="http://ketm-gg.sf.net"
depends=(sdl)
arch=('any')
source=(
  "http://ftp.debian.org/debian/pool/main/k/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
	"http://ftp.debian.org/debian/pool/main/k/${pkgname}/${pkgname}_${pkgver}-25.debian.tar.xz"
)
sha512sums=(
  '30f83911bae02fe48ab288c209b8d18457542c222b60f7a973fe4e3128ceb654b62a495de97453c524c17f4aa43b5210889488a22ab25f8828cdb251a940da24'
  '75add7cebdb81da643549f1819fc167acf64c524f5ddb014eca2697bb8660cfd33200dc596ba802fe4d2f25ae4585c7ba9a2bfc5189abd2ac71f62479b5cbb6d'
)

build(){
	cd ${srcdir}/
  mv debian ${pkgname}-${pkgver}/
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
