# Maintainer: Aloxaf <aloxafx@gmail.com>

# rename from page to page-generator to avoid conflict with https://github.com/I60R/page
pkgname=page-generator
pkgver=6.0.1
pkgrel=1
pkgdesc='Python Automatic GUI Generator'
arch=('x86_64')
url="http://page.sourceforge.net/"
license=('GPL')
depends=('tk' 'python')
source=("https://jaist.dl.sourceforge.net/project/page/page/${pkgver}/page-${pkgver}.tgz")
sha256sums=('3e07cea7d02676bb3e934955c891dcf4a86c4acac41d6bf805e716a2a6a020af')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"

	cp -r "page/" "${pkgdir}/usr/share/${pkgname}"

	cat > "${pkgdir}/usr/bin/${pkgname}" << \EOF
#!/bin/sh

exec python3 /usr/share/page-generator/page.py "$*"
EOF

    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=PAGE
Comment=Python Automatic GUI Generator
Icon=/usr/share/${pkgname}/page-icons/page256.png
Exec=${pkgname}
Terminal=false
Type=Application
Categories=Development;
EOF
}
