# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=autenticacao-gov-pt
pkgver=2.0.23
pkgrel=1
pkgdesc="O Autenticação.gov.pt é o mecanismo que permite utilizar o Cartão de Cidadão eficientemente e em segurança nos navegadores que suportem ou não plugins Java"
arch=('any')
url="http://autenticacao.gov.pt/"
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("autenticacao-gov-pt.install" "https://autenticacao.gov.pt/fa/ajuda/software/plugin-autenticacao-gov.deb")

sha1sums=('6e7d1ed2a60dad888026dd82abbe6199e7d4231b'
          'e19e42c20a7d6e63bbf367c9871baf616ef5bf33')

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
