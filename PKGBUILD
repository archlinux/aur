# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=cartaodecidadao-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Portuguese Citizen Card Application"
arch=('x86_64')
url="http://www.cartaodecidadao.pt/"
license=('GPL2' 'LGPL3' 'custom:EUPL')
depends=('qt5-base'
         'qt5-tools'
         'qt5-quickcontrols'
				 'qt5-quickcontrols2'
         'qt5-graphicaleffects'
         'pcsclite>=1.5.0'
         'openssl-1.0'
         'ccid'
         'libzip'
         'poppler-qt5'
				 'libxerces-c-3.1'
				 'libcurl-compat'
         'xml-security-c')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
			'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
			'ecce-gov-pt-certificates: Certificados da ECCE (quem assina dos certificados contidos em cartaodecidadao-pki)')

source_x86_64=("https://www.autenticacao.gov.pt/documents/10179/11962/Autenticacao.gov_Ubuntu_19_x64.deb")

md5sums_x86_64=('fb90d49674be52c6ce7f0e6b1afe8810')

prepare() {
	tar -xf data.tar.xz
}

package() {
	mkdir -p "${pkgdir}/usr/local/"
	mkdir -p "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/lib"
	
	# Move files into place
	mv "${srcdir}"/usr/local/{share,bin} "${pkgdir}/usr/local/"
	mv "${srcdir}"/usr/local/* "${pkgdir}/usr/"
	mv "${srcdir}"/usr/share/* "${pkgdir}/usr/share/"
	
	# Missing libcurl-nss.so.4
	# TODO: build lib
	#cp "/usr/lib/libcurl-openssl-1.0.so.4.5.0" "${pkgdir}/usr/lib/libcurl-nss.so.4"

	# Fix symlinks
	ln -s libxml-security-c.so "${pkgdir}/usr/lib/libxml-security-c.so.17"
	ln -s libcurl.so.3 "${pkgdir}/usr/lib/libcurl-nss.so.4"
	ln -s "/usr/lib/libzip.so" "${pkgdir}/usr/lib/libzip.so.4"
	
	
	
#	# Move everything to install dir
#	mv "${srcdir}/usr" ${pkgdir}

#	# Fix desktop files
#	sed -i -e "s|/local||g" ${srcdir}/usr/share/applications/*
#	sed -i -e "s|bin/images/app.png|share/pixmaps/cartaodecidadao.png|g" ${srcdir}/usr/share/applications/*
#
#	# Move binaries out of local
#	cp -r ${srcdir}/usr/local/* ${srcdir}/usr/
#	rm -r ${srcdir}/usr/local
#
#	# Move images to pixmaps
#	mkdir -p ${pkgdir}/usr/share/pixmaps/
#	mv ${srcdir}/usr/bin/images/app.png ${pkgdir}/usr/share/pixmaps/cartaodecidadao.png
#
#	# remove uneeeded stuff
#	rm -rf ${srcdir}/etc
#	rm ${srcdir}/usr/bin/arranque.sh
#	rm -rf ${srcdir}/usr/{local,}/bin/images
#
#	# Fix some filenames
#	mv "${srcdir}/usr/share/applications/Aplicação da Área da Notificação.desktop" "${srcdir}/usr/share/applications/areadenotificacao.desktop"
#	mv "${srcdir}/usr/share/applications/Cartão de Cidadão.desktop"	"${srcdir}/usr/share/applications/cartaodecidadao.desktop"
#
#	# Add missing link to file
#	ln -sr ${srcdir}/usr/lib/libpteiddlg.so.1 ${srcdir}/usr/lib/libpteiddlg.so
#
#	# Move everything to install dir
#	cp -r ${srcdir}/usr* ${pkgdir}
}
