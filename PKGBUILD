# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit
pkgver=3.4.0
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/threat9/routersploit"
depends=('python-future' 'python-requests' 'python-paramiko' 'python-pysnmp' 'python-crypto')
source=("${pkgname}_v${pkgver}.tar.gz"::"https://github.com/threat9/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9182598105c4d1c971dc63ac24059469dd1862af204f59994cfc85012091663a85faee4c7c04cce573eef1fa91525b44a3963b8c24460d3b31595c4ef6a6c4e5')

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
