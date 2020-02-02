# Maintainer: Edward Wawrzynek <edward@wawrzynek.com>

pkgname=ftcfrcsimulator
pkgver=4.2
pkgrel=1
pkgdesc="FIRST Tech Challenge and FIRST Robotics Competition Simulator"
arch=('x86_64')
url="http://ftcsimulator.org"
license=('unknown')
depends=('gtk2')
optdepends=('openvr: For VR support')

source=("${pkgname}-${pkgver}.zip::http://ftcsimulator.org/?smd_process_download=1&download_id=794")
sha1sums=("f6b3ccfe3d958ebc4033eb68c3571e24bab36037")

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/ftcfrcsimulator" "${pkgdir}/usr/bin"
	cp -r "FTC Simulator v${pkgver} Linux x64_Data" "${pkgdir}/usr/share/ftcfrcsimulator/"
	chmod -R 0755 "${pkgdir}/usr/share/ftcfrcsimulator"
	find "${pkgdir}/usr/share/ftcfrcsimulator/" -type f -exec chmod 644 {} \;
	install -Dm755 "FTC Simulator v${pkgver} Linux x64.x86_64" "${pkgdir}/usr/share/ftcfrcsimulator/FTC Simulator v${pkgver} Linux x64.x86_64"
	#ln -s "/usr/share/ftcfrcsimulator/FTC Simulator v${pkgver} Linux x64.x86_64" "${pkgdir}/usr/bin/ftcfrcsimulator"
	cat <<EOF > "${pkgdir}"/usr/bin/ftcfrcsimulator
#!/bin/bash
"/usr/share/ftcfrcsimulator/FTC Simulator v${pkgver} Linux x64.x86_64"
EOF
	chmod 0755 "${pkgdir}"/usr/bin/ftcfrcsimulator
}
