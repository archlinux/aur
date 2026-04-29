# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=betcon
pkgver=2.1.0
pkgrel=1
pkgdesc="Sports betting management"
url="http://betcon.eduardoparra.es"
arch=('x86_64')
license=('GPLv3')
depends=('python' 'pyside6' 'qt6-tools' 'python-numpy' 'python-yaml' 'python-pillow' 'python-pyqtgraph' 'python-colorama')
source=("https://github.com/soker90/betcon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	# Install Python source files maintaining directory structure
	install -dm755 "${pkgdir}/opt/betcon"
	cp -r src "${pkgdir}/opt/betcon/"
	cp -r ui "${pkgdir}/opt/betcon/"
	cp -r lang "${pkgdir}/opt/betcon/"
	cp -r assets "${pkgdir}/opt/betcon/"
	cp -r resources "${pkgdir}/opt/betcon/"
	cp -r default "${pkgdir}/opt/betcon/"
	
	# Install wrapper script
	install -dm755 "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/betcon" << 'EOF'
#!/bin/bash
cd /opt/betcon/src
exec python Betcon "$@"
EOF
	chmod +x "${pkgdir}/usr/bin/betcon"
	
	# Install desktop file
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 resources/betcon.desktop "${pkgdir}/usr/share/applications/betcon.desktop"
	
	# Install icon
	install -dm755 "${pkgdir}/usr/share/pixmaps"
	install -Dm644 resources/icon.png "${pkgdir}/usr/share/pixmaps/betcon.png"
}


