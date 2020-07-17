# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=autenticacao-gov-pt-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Portuguese Citizen Card Application (Portugal eID) - version with pre compiled binaries"
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
optdepends=('plugin-autenticacao-gov-pt: Necessário para autenticações online'
			'autenticacao-gov-pt-pki: PKI que confirma a validade dos certificados dos CC'
			'ecce-gov-pt-certificates: Certificados da ECCE - quem assina dos certificados contidos em cartaodecidadao-pki')
conflicts=('cartaodecidadao' 'cartaodecidadao-bin' 'autenticacao-gov-pt')
replaces=('cartaodecidadao-bin')

source_x86_64=("https://www.autenticacao.gov.pt/documents/20126/78595/Autenticacao.gov_Ubuntu_20_x64.deb")

sha512sums_x86_64=('506fcea357d1c5d21a843bd6398486e783256096cb7edc9cc6af2b0d27d2b14a682c1e32f23521f1d3ec876ebba19be79b86f6dff0982812517033568cd75252')

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

	# Fix symlinks
	ln -s libcurl.so.3 "${pkgdir}/usr/lib/libcurl-nss.so.4"
}
