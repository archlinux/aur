# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit
pkgver=3.2.0
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/threat9/routersploit"
depends=('python-future' 'python-requests' 'python-paramiko' 'python-pysnmp' 'python-crypto')
source=("${pkgname}_v${pkgver}.tar.gz"::"https://github.com/threat9/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('210c02823a1d4dcf80ac8657d8400b2102cb73c3dbf882346cb9426baaf35277cff926e7f7bc992d0a34ccedcf691128998095637d04c46ba9717a26cd7a2ff6')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Copy self containing python modules
	install -D ./rsf.py "${pkgdir}/opt/routersploit/rsf.py"
	cp -dpr --no-preserve=ownership "./${pkgname}" "${pkgdir}/opt/${pkgname}"

	# Install a specially crafted invocation for the binary
	install -d "${pkgdir}"/usr/bin
	echo -e "#!/bin/sh\ncd /opt/${pkgname} && exec ./rsf.py \"\$@\"\ncd -" > "${pkgdir}/usr/bin/rsf"
	chmod 755 "${pkgdir}/usr/bin/rsf"

	install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
