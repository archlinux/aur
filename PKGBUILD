# Maintainer: Tyler Witten <turtlewit@live.com>
pkgname=piskel
pkgver=0.14.0
pkgrel=1
pkgdesc="A free online editor for animated sprites & pixel art."
arch=('x86_64')
url="https://github.com/piskelapp/piskel"
license=('Apache')
groups=()
depends=('gconf' 'gtk2')
makedepends=('npm' 'nodejs-grunt' 'bash-completion')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/piskelapp/piskel/archive/v0.14.0.tar.gz")
noextract=()
md5sums=('18fcdaad58efc6f45e85bb474d17607d')

build() {
	cd "${pkgname}-${pkgver}"
	npm install
	grunt --force desktop
}

package() {
	install -d "${pkgdir}/opt/Piskel/"
	cp -a "${pkgname}-${pkgver}/dest/desktop/piskel/linux64/." "${pkgdir}/opt/Piskel/"
	chmod +r -R "${pkgdir}/opt/Piskel/"
	chmod +rx "${pkgdir}/opt/Piskel/lib/"
	chmod +x "${pkgdir}/opt/Piskel/piskel"
	
	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/../Piskel.desktop" "${pkgdir}/usr/share/applications"
	
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Piskel/piskel" "${pkgdir}/usr/bin/piskel"
	
	convert "${srcdir}/${pkgname}-${pkgver}/misc/desktop/logo.ico" "${srcdir}/${pkgname}-${pkgver}/misc/desktop/logo.png"
	install -d "${pkgdir}/usr/share/pixmaps"
	cp "${srcdir}/${pkgname}-${pkgver}/misc/desktop/logo-3.png" "${pkgdir}/usr/share/pixmaps/piskel.png"
	
}


