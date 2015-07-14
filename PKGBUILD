# Maintainer: Max Roder <maxroder@mailbox.org>

pkgname='knightsandmerchants-remake-server'
pkgver='r6720'
pkgrel='1'
pkgdesc='Dedicated server for the Knights And Merchants Remake (strategy game)'
url='http://www.kamremake.com'
arch=('x86_64' 'i686')
license=('unknown')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::http://www.kamremake.com/files/kam_remake_server_${pkgver}-zip"
		"kam-server.sh")
sha256sums=('4912d3d097fc2741f42be8879cccbfdfc09a1bf83e7b6552c11e6460ff6a9b87'
            'bf8d39e962b37089a94840d918c496796d589227158ed5f479f37d718e8cb130')
package() {
	cd ${srcdir}

	# 775 to allow writing of log files and configuration
	install -d -m 775 -g games "${pkgdir}/usr/share/${pkgname}/"

	if [[ "$CARCH" == 'i686' ]]; then
		install -D -m 755 KaM_Remake_Server_x86 "${pkgdir}/usr/share/${pkgname}/KaM_Remake_Server_x86"
	else
		install -D -m 755 KaM_Remake_Server_x86_64 "${pkgdir}/usr/share/${pkgname}/KaM_Remake_Server_x86_64"
	fi

	install -D -m 755 kam-server.sh "${pkgdir}/usr/bin/kam-server"
}

# vim:set ts=2 sw=2 et:

