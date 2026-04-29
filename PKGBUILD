# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=betcon
pkgver=2.0.0
pkgrel=3
pkgdesc="Sports betting management"
url="http://betcon.eduardoparra.es"
arch=('x86_64')
license=('GPLv3')
depends=('gcc-libs' 'glibc' 'python-numpy' 'python-yaml' 'python-pillow' 'python-pyqtgraph')
options=('!strip' '!debug')
source=("https://github.com/soker90/betcon/releases/download/v$pkgver/betcon-$pkgver-linux-x86_64.tar.gz")
sha256sums=('4cb9a98a2c26c660fa8bf94d3bfe3f4de4cca0c3f21f03418fccb07235885d7a')

package() {
	install -dm755 "${pkgdir}/opt/betcon"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/applications"
	install -dm755 "${pkgdir}/usr/share/pixmaps"

	cp -r "${srcdir}/betcon/"* "${pkgdir}/opt/betcon/"

	cat > "${pkgdir}/usr/bin/betcon" << 'EOF'
#!/bin/sh
exec /opt/betcon/betcon "$@"
EOF
	chmod +x "${pkgdir}/usr/bin/betcon"

	# Create desktop file
	cat > "${pkgdir}/usr/share/applications/betcon.desktop" << 'EOF'
[Desktop Entry]
Name=Betcon
Comment=Gestión de apuestas deportivas
Exec=betcon
Icon=betcon
Terminal=false
Type=Application
Categories=Office;Finance;
EOF

	# Install icon if it exists in the package
	if [ -f "${srcdir}/betcon/_internal/resources/icon.png" ]; then
		install -Dm644 "${srcdir}/betcon/_internal/resources/icon.png" \
			"${pkgdir}/usr/share/pixmaps/betcon.png"
	fi
}


