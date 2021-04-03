# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=autenticacao-gov-pt-bin
pkgver=3.5.0
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

source_x86_64=("https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw_ubuntu20_amd64.deb"
							 "autenticacao-gov-pt-bin.install")

sha512sums_x86_64=('4a2dbaa7a6e02699d231480b1313bb0e50786c92ce0bb0b223c9e587af42a89a2837ab1f6fb5d027b46c0625a41e33ab52963e44672352470e2511935d9589e1'
                   'd38b9748f386fcf64f3f0cb717eccf7936c64f0e7b6370ae3b1b079902015ce56d3057afcf2877ca4eee38776269ac3642701803ba96b24a81cfccc9a4d3245f')

install='autenticacao-gov-pt-bin.install'
prepare() {
	tar -xf data.tar.xz
}

package() {
	mkdir -p "${pkgdir}/usr/local/"
	mkdir -p "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/lib"
	
	# Move files into the correct place
	mv "${srcdir}"/usr/local/{share,bin} "${pkgdir}/usr/local/"
	mv "${srcdir}"/usr/local/* "${pkgdir}/usr/"
	mv "${srcdir}"/usr/share/* "${pkgdir}/usr/share/"
}
