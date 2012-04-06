# Maintainer: Troels Kofoed Jacobsen <tkjacobsen@gmail.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=qonk
pkgver=0.3.1
pkgrel=2
pkgdesc="A small space build-and-conquer strategy game."
url="http://qonk.sf.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_ttf' 'sdl_gfx' 'sdl_image')
source=(http://downloads.sourceforge.net/qonk/${pkgname}-${pkgver}.tar.gz
        qonk.desktop
        qonk.png
        qonk.patch)
md5sums=('9491980477ac5beb5bba6b8234d2ddfd'
         'ecce69a75740e0cac5e39cb59198f354'
         '8f8d7b7d06111b102f6c1ad1aad290c0'
         'd479f49309f864e1db8e487fe062fc0d')
     
build() { 
	cd ${srcdir}/${pkgname}-${pkgver}
	
	patch -Np0 -i ${srcdir}/${pkgname}.patch
	
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	make DESTDIR="${pkgdir}/" install
	
	# delete the guichan header file
	rm -r ${pkgdir}/guichan

	# install the .desktop file
	install -Dm0644 ${srcdir}/qonk.desktop ${pkgdir}/usr/share/applications/qonk.desktop
	install -Dm0644 ${srcdir}/qonk.png ${pkgdir}/usr/share/qonk/qonk.png
}
