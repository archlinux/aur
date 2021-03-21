# Maintainer: Edward Wawrzynek <edward@wawrzynek.com>

pkgname=xrcsimulator
pkgver=5.8e
pkgdesc="FIRST Tech Challenge, FIRST Robotics Competition, and VEX Simulator"
pkgrel=1
arch=('x86_64')
url="http://xrcsimulator.org"
license=('unknown')
depends=('gtk2')
optdepends=('openvr: For VR support')
replaces=('ftcfrcsimulator')

# Base name of files in the zip
_files_name="xRC Simulator v5.8"

source=(
	"${pkgname}-${pkgver}.zip::http://xrcsimulator.org/?smd_process_download=1&download_id=1489"
	"xrcsimulator.desktop"
	"16x16.png"
	"24x24.png"
	"32x32.png"
	"48x48.png"
	"64x64.png"
	"128x128.png"
	"256x256.png"
)

sha1sums=(
	"d7cb478b525522f451d51f17e73fefaab33fa13f"
	"07ee699a267425f01c7e28c2369ba6521bd515ec"
	"7a0283d47e945b66a82dcbd11bdd10a6406dd027"
	"deb5297344427dd07d8044543f1c023b0c4c001c"
	"01312dc1c5bbcb69c5b910c674d8f51c7564d8b3"
	"bcb139939ae04ddabf011816d137e3c356e509c4"
	"02e1963f4a8fca718e0404f19341548b46e8fcdd"
	"e0ed7e877be272cbe2ae5a5f4e913ee04bc5bb4c"
	"0359a58666f88aefa8403846b74b877587e9a306"
)

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/xrcsimulator" "${pkgdir}/usr/bin"
	# Copy data to /usr/share, set directory permissions to 755, file permissions to 644
	cp -r "${_files_name}_Data" "${pkgdir}/usr/share/xrcsimulator/"
	chmod -R 0755 "${pkgdir}/usr/share/xrcsimulator"
	find "${pkgdir}/usr/share/xrcsimulator/" -type f -exec chmod 644 {} \;
	# Copy binary over
	install -Dm755 "${_files_name}.x86_64" "${pkgdir}/usr/share/xrcsimulator/${_files_name}.x86_64"
	# Put a script in /usr/bin to run app
	cat <<EOF > "${pkgdir}"/usr/bin/xrcsimulator
#!/bin/bash
"/usr/share/xrcsimulator/${_files_name}.x86_64"
EOF
	chmod 0755 "${pkgdir}"/usr/bin/xrcsimulator
	# Desktop Entry
	install -Dm644 xrcsimulator.desktop "${pkgdir}/usr/share/applications/frcfrcsimulator.desktop"
	# Logos
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/xrcsimulator.png"
	done	
}
