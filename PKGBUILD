# Maintainer: Aloxaf <aloxafx@gmail.com>

# rename from page to page-generator to avoid conflict with https://github.com/I60R/page
pkgname=page-generator
pkgver=5.0.3
pkgrel=1
pkgdesc='Python Automatic GUI Generator'
arch=('x86_64')
url="http://page.sourceforge.net/"
license=('GPL')
depends=('tk' 'python')
source=("https://jaist.dl.sourceforge.net/project/page/page/${pkgver}/page-${pkgver}.tgz")
sha256sums=('0fd9dbcc65840f5c799cbe6fa0201e67f4a8a96de1c7896e1bebd90392669a23')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"

	cp -r "page/" "${pkgdir}/usr/share/${pkgname}"

	cat > "${pkgdir}/usr/bin/${pkgname}" << \EOF
#!/bin/sh

PATH_TO_WISH=/usr/bin/wish8.6
PAGE_HOME=/usr/share/page-generator

export PATH_TO_WISH
export PAGE_HOME

exec ${PATH_TO_WISH} ${PAGE_HOME}/page.tcl "$*"
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
