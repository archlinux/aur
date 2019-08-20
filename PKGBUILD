# Maintainer: Aloxaf <aloxafx@gmail.com>

# rename from page to page-generator to avoid conflict with https://github.com/I60R/page
pkgname=page-generator
pkgver=4.25
pkgrel=1
pkgdesc='Python Automatic GUI Generator'
arch=('x86_64')
url="http://page.sourceforge.net/"
license=('GPL')
depends=('tk' 'python')
source=("https://jaist.dl.sourceforge.net/project/page/page/${pkgver}/page-${pkgver}.tgz")
sha256sums=('4e64d94e56fd487e5e2f43703fa8df44c4074ad2d29dcbbc4d9d44ba8905c98f')

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
