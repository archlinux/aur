# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit
pkgver=3.1.0
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/threat9/routersploit"
depends=('python-future' 'python-requests' 'python-paramiko' 'python-pysnmp' 'python-crypto')
source=("${pkgname}_v${pkgver}.tar.gz"::"https://github.com/threat9/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1fd80e811b6f36d751b9a89a2d4d6721cdbf9c9906b806f035a95d2455065639e780f27cbe5d95b101b6fec03882d3518ba25fcb5e2d0419b9d42a8a6809b59f')

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
