#  Maintainer: hrocho <hrocho at vodacionline dot sk>
pkgname=brlcad-bin
pkgver=7.26.0
pkgrel=0
pkgdesc="An extensive 3D solid modeling system."
url="http://brlcad.org"
license=('LGPL' 'BSD' 'custom:BDL')
arch=('x86_64')
# install=$pkgname.install
makedepends=('bc' 'cmake' 'libxslt')
depends=('rpmextract' 'boost' 'flex' 'libgl' 'libpng' 'mesa' 'tk' 'zlib')

if [ "$CARCH" = "x86_64" ]; then
	    source=(http://downloads.sourceforge.net/project/brlcad/BRL-CAD%20for%20Linux/$pkgver/BRL-CAD_$pkgver.2_Linux_x86_64.tar.gz)
		md5sums=('c0f30ca1d5f982292f2988fa798950c6')
fi


package() {

	mkdir --parents "${pkgdir}/opt/${pkgname}"
	cp -r ${srcdir}/BRL-CAD_7.26.0_Linux_x86_64/* "${pkgdir}/opt/${pkgname}"


	mkdir --parents "${pkgdir}/etc/profile.d"
	mkdir --parents  "${pkgdir}/etc/ld.so.conf.d"
		
	echo "export PATH=\"\$PATH:/opt/${pkgname}/bin\"" >"${pkgdir}/etc/profile.d/${pkgname}.sh"
        chmod u=rwx,go=rx "${pkgdir}/etc/profile.d/${pkgname}.sh"
        
	echo "/opt/${pkgname}/lib" >"${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
	chmod u=rwx,go=rx "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

}
