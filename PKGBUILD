# Maintainer: Glow <glow[at]mawsandclaws[dot]xyz>
# Contributor: 

pkgname="file-lock-pea"
pkgver=1.6
pkgrel=1
pkgdesc="File and Folder Encryption"
url="https://eck.cologne/peafactory/en/html/file_pea.html"
license=("GPL-2.0")
arch=('x86_64')

depends=(
	'java-runtime'
)

source=(
	"https://eck.cologne/peafactory/src/downloads/filePEA/Dragonfly-Threefish-Blake2b/file-lock-pea-1.6.zip?"
	"https://eck.cologne/peafactory/src/img/peafactory_images/pea-lock.png"
	)
sha256sums=('9109583ef714fba8ba3546323e9cdf60bd4d2fcb5279e96363ae7376615b7dbc'
		'SKIP'
	)

package() {
	install -d "${pkgdir}/opt"
	cp -r "$srcdir/FileLockPEA-1.6" "$pkgdir/opt/"
	install -Dm 644  "$srcdir/pea-lock.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/pea-lock.png"
	install -d "$pkgdir/usr/bin"
	cat <<EOF > "$pkgdir/usr/bin/file-lock-pea"
cd /opt/FileLockPEA-1.6 && ./unix_start_helper.sh
EOF
chmod +x "$pkgdir/usr/bin/file-lock-pea"
	install -d "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/file-lock-pea.desktop"
[Desktop Entry]
Name=File Lock PEA
Comment=File and Folder Encryption
Exec=file-lock-pea
Icon=/usr/share/icons/hicolor/48x48/apps/pea-lock.png
Type=Application
Categories=Utility;
EOF
}