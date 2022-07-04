# Maintainer: Fansure Grin <fansuregrin@outlook.com>
pkgname=panindex
_pkgname=PanIndex
pkgver=3.0.8
pkgrel=2
pkgdesc="Simple network-disk directory listing program"
arch=('x86_64')
url="https://github.com/libsgh/PanIndex"
license=('AGPL-3.0')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz"
				"${_pkgname}.service"
				'config.json')
sha256sums=('988feb98333690d834025dc30bb22e514eecd7f2abd0d9239db00f70329b9012'
						'c87d28e8216a0e46be6e9cd6b56dc4556bfd52412268897d5b30028680f1981c'
						'af014db474631d347bcf5a0a9b837de2fffe179dee085f540294a2de6dcacc3e')
options=(!strip)

package() {
	cd ${srcdir}

	# install license file
	install -vDm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

	# install executable file
	mv ${_pkgname}-linux-amd64  ${_pkgname}
	install -vDm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

	# install systemd service file
	install -vDm644 ${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service

	# install config directory and config.json file
	install -vdm755 ${pkgdir}/etc/${_pkgname}	
	install -vDm644 config.json ${pkgdir}/etc/${_pkgname}/config.json
}
