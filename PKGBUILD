# Maintainer: Edward Wawrzynek <edward@wawrzynek.com>

pkgname=ftcfrcsimulator
pkgver=4.2c
_code_pkgver=4.2
pkgrel=2
pkgdesc="FIRST Tech Challenge and FIRST Robotics Competition Simulator"
arch=('x86_64')
url="http://ftcsimulator.org"
license=('unknown')
depends=('gtk2')
optdepends=('openvr: For VR support')

source=(
	"${pkgname}-${pkgver}.zip::http://ftcsimulator.org/?smd_process_download=1&download_id=816"
	"ftcfrcsimulator.desktop"
	"16x16.png"
	"24x24.png"
	"32x32.png"
	"48x48.png"
	"64x64.png"
	"128x128.png"
	"256x256.png"
)
sha1sums=(
	"d0369e9ef765fa17656974043fd1a9236cd2a569"
	"53940cf0b7bf2acb748949b8c572a89b5711ba4e"
	"5b3f36d076bd653468b14f1f2afd8dd74e84ca27"
	"385243f17f54ebd8dae00292fa228c8e3cf980d8"
	"583c25b180d5f186fc797fb6ff5975483e79496b"
	"ca5d0e8da475c3755eb4ecd8f48b455cec3a482c"
	"16c8e3fa3ab27d148f2c86a3cd18fad73b5e7016"
	"3fe9749c44c1e7d7060ec5c1ff8903ff37f1c488"
	"0906ac5d429d0370779e77f3fd194848e9c8b70c"
)

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/ftcfrcsimulator" "${pkgdir}/usr/bin"
	# Copy data to /usr/share, set directory permissions to 755, file permissions to 644
	cp -r "FTC Simulator v${_code_pkgver} Linux x64_Data" "${pkgdir}/usr/share/ftcfrcsimulator/"
	chmod -R 0755 "${pkgdir}/usr/share/ftcfrcsimulator"
	find "${pkgdir}/usr/share/ftcfrcsimulator/" -type f -exec chmod 644 {} \;
	# Copy binary over
	install -Dm755 "FTC Simulator v${_code_pkgver} Linux x64.x86_64" "${pkgdir}/usr/share/ftcfrcsimulator/FTC Simulator v${_code_pkgver} Linux x64.x86_64"
	# Put a script in /usr/bin to run app
	cat <<EOF > "${pkgdir}"/usr/bin/ftcfrcsimulator
#!/bin/bash
"/usr/share/ftcfrcsimulator/FTC Simulator v${_code_pkgver} Linux x64.x86_64"
EOF
	chmod 0755 "${pkgdir}"/usr/bin/ftcfrcsimulator
	# Desktop Entry
	install -Dm644 ftcfrcsimulator.desktop "${pkgdir}/usr/share/applications/frcfrcsimulator.desktop"
	# Logos
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/ftcfrcsimulator.png"
	done	
}
