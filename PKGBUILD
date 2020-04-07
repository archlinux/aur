# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=autenticacao-gov-pt
pkgver=2.0.46
pkgrel=1
pkgdesc="O Autenticação.gov.pt é o mecanismo que permite utilizar o Cartão de Cidadão eficientemente e em segurança nos navegadores que suportem ou não plugins Java"
arch=('any')
url="http://autenticacao.gov.pt/"
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("autenticacao-gov-pt.install" "https://autenticacao.gov.pt/fa/ajuda/software/plugin-autenticacao-gov.deb")

sha512sums=('d80ecff72fa50f5e4a22a2a662c57b26d13750b89690c1a617db81b61097d1b8b9da8d7469f73f537c740f10660e048e7201d87fde53b8ac19a630720f8db7ed'
            '64aaf0e567e96cda1819e0108aac989fb8d92947d4fac52b525f592cfc4b8e625a2343b9c0568de336873a2ca952412e35f9196d470c0ed9f465c4a2a679dcc7')

install='autenticacao-gov-pt.install'

prepare() {
	tar -zxf data.tar.gz
}

package() {
	# Place license on the correct place
	mkdir -p ${srcdir}/usr/share/licenses/autenticacao-gov-pt/
	mv ${srcdir}/usr/share/doc/plugin-autenticacao-gov/copyright ${srcdir}/usr/share/licenses/autenticacao-gov-pt/LICENSE

	# Move everything to install dir
	cp -r ${srcdir}/usr* ${pkgdir}

	# They decided to rename the package so, let's just keep it with the same name
	cd ${pkgdir}/usr/share
	mv plugin-autenticacao-gov autenticacao-gov-pt
	sed -i -e "s|/plugin-autenticacao-gov/|/autenticacao-gov-pt/|g" applications/plugin-autenticacao-gov.desktop
}
