# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=fahclient
pkgver=7.5.1
_shortver=7.5
pkgrel=3
pkgdesc='A command line client for Folding@Home'
url="https://foldingathome.org/"
arch=('x86_64')
license=('GPL3')
depends=('zlib')

source=("https://download.foldingathome.org/releases/public/release/$pkgname/debian-stable-64bit/v${_shortver}/${pkgname}_${pkgver}_amd64.deb"
		'fahclient.service')
sha256sums=('efe47061d328667259c1815b98bc6c37da339363fb8e9386673f6a96f4d37d26'
            '373356d3a4a75f86f5a7118cf9a2c9b5998174880bc915cb0099bb9d3f351aa1')

prepare() {
	tar xf data.tar.xz
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	for bin in "${srcdir}"/usr/bin/*; do 
    	install -Dm0755 "${bin}" "${pkgdir}/usr/bin"; 
	done
 	
 	mkdir -p "${pkgdir}/usr/share/doc/fahclient"
 	for doc in "${srcdir}"/usr/share/doc/fahclient/*; do 
    	install -Dm0644 "${doc}" "${pkgdir}/usr/share/doc/fahclient"; 
	done

	mkdir -p "${pkgdir}/usr/share/pixmaps"
	for pixmap in "${srcdir}"/usr/share/pixmaps/*; do 
    	install -Dm0644 "${pixmap}" "${pkgdir}/usr/share/pixmaps"; 
	done
	
	mkdir -p "${pkgdir}/usr/share/applications"
	install -Dm0644 "${srcdir}/usr/share/applications/FAHWebControl.desktop" "${pkgdir}/usr/share/applications"
	install -Dm0644 "$srcdir/fahclient.service" "$pkgdir/usr/lib/systemd/user/fahclient.service"
}
