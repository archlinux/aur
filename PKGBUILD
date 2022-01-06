# Maintainer: Fansure Grin <fansuregrin@outlook.com>
pkgname=panindex
_pkgname=PanIndex
pkgver=2.0.9
pkgrel=1
pkgdesc="Simple network-disk directory listing program"
arch=('x86_64')
url="https://github.com/libsgh/PanIndex"
license=('AGPL-3.0')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f755c30b3a0b5b2537eb28a553edc83deb3d2cb97a9cb6ec5a8fef9c7bbe2209')

package() {
	cd ${srcdir}
	# license
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	# executable file
	install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	# service
	install -dm755 ${pkgdir}/etc/systemd/system	
	touch ${pkgdir}/etc/systemd/system/${_pkgname}.service
	chmod 755 ${pkgdir}/etc/systemd/system/${_pkgname}.service
	echo '[Unit]
Description=PanIndex Service
Documentation=https://libsgh.github.io/PanIndex/
After=network.target
[Service]
User=root
WorkingDirectory=/etc/PanIndex
ExecStart=/usr/bin/PanIndex
Environment="PAN_INDEX_DATA_PATH=/etc/PanIndex"
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000
[Install]
WantedBy=multi-user.target
' > ${pkgdir}/etc/systemd/system/${_pkgname}.service
	# config dir
	install -Ddm755 ${pkgdir}/etc/${_pkgname}	
}
