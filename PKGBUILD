# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=eidklient
pkgver=1.9.4
pkgrel=1
pkgdesc="Slovak eID Client"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
depends=("glibc" "qt4" "pcsclite" "qt5-imageformats" "ccid" "openssl" "chrpath" )
source_i686=('https://eidas.minv.sk/TCTokenService/download/linux/debian/eidklient_i386_debian.tar.gz')
source_x86_64=('https://eidas.minv.sk/TCTokenService/download/linux/debian/eidklient_amd64_debian.tar.gz')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")

pkgver() {
	# Match Debian package version
	ar p ${srcdir}/eID_klient/eidklient_amd64_debian.deb control.tar.gz | tar -Oxz ./control | grep ^Version: | cut -f2 -d" "
}

package() {
	ar p ${srcdir}/eID_klient/eidklient_amd64_debian.deb data.tar.gz | tar -xz -C "${pkgdir}"
	
	# Update script is for Debian. Update from AUR in Arch.
	rm ${pkgdir}/usr/bin/eIdKlient-update

	# The application requires the libraries in a specific location
	ln -sf /usr/lib/qt/plugins/imageformats/libqtga.so ${pkgdir}/usr/lib/eidklient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqgif.so ${pkgdir}/usr/lib/eidklient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqico.so ${pkgdir}/usr/lib/eidklient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqjpeg.so ${pkgdir}/usr/lib/eidklient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqmng.so ${pkgdir}/usr/lib/eidklient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqsvg.so ${pkgdir}/usr/lib/eidklient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqtiff.so ${pkgdir}/usr/lib/eidklient/
}
