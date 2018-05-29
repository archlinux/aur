# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=routersploit
pkgver=3.0.0
pkgrel=1
pkgdesc="An open-source exploitation framework dedicated to embedded devices."
arch=('any')
license=('BSD')
url="https://github.com/threat9/routersploit"
depends=('python-future' 'python-requests' 'python-paramiko' 'python-pysnmp' 'python-crypto')
source=("${pkgname}_v${pkgver}.tar.gz"::"https://github.com/threat9/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0367a11c086e98db08691f25f6a45cf3e210948d9f06e91602230d87f091a28387b51cbc8bc6e9d7d0a2da0f5ab4cd404a683dee290956e8754a988e0912fa27')

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
