# Maintainer: Aloxaf <aloxafx@gmail.com>

# rename from page to page-generator to avoid conflict with https://github.com/I60R/page
pkgname=page-generator
pkgver=7.5
pkgrel=1
pkgdesc='Python Automatic GUI Generator'
arch=('x86_64')
url="http://page.sourceforge.net/"
license=('GPL')
depends=('tk' 'python')
source=("https://jaist.dl.sourceforge.net/project/page/page/${pkgver}/page-${pkgver}.tgz")
sha256sums=('c77f62957b764404382d47c14704a590fe46158eb5842fa13c9ce6e21b260f5b')

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
