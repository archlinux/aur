# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=hannah
pkgver=2.0.1
pkgrel=1
pkgdesc='Help Hannahs Horse Its Pacman with ghosts, music and powerups. And carrots.'
url='https://retrojunkies.co.uk/welsh/home/index/91'
license=('GPL3')
arch=('x86_64' 'aarch64')
conflicts=(${pkgname}-svn)
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
source=("https://master.dl.sourceforge.net/project/${pkgname}/${pkgname}-2.0/${pkgname^}-${pkgver}-src.tar.bz2"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha512sums=('9220c212f462ec16c4212966e6b0fcf1dc42565a9fed87a31efe19d66b6e1a1029f471651de1732180f2eeca00b7724ea346ac255914934567d8b068707ccfe9'
            'c7e27029778395fab64ffb4d56decfc078ddc10ebddb9e325dd8e8553f5a4060231e24ff2b112b7ff258e4ae8038b8c4d1a28d2d859e793e1f46f2e861c885b9'
            '660671bbaafe7dfc7ff3eeca0eb7b4329c868a7d5a24a0cf8b79a5ae009881a614b7e437425b35070e006dce6a439f03e4d1b11a615655d3a95b109ce913fdfa')
prepare() {
	cd ${srcdir}"/"${pkgname^}
  mv Makefile.linux Makefile
}

build() {
	cd ${srcdir}"/"${pkgname^}
	make DATA_INSTALL_DIR=/usr/local/share/hannah BIN_DIR=/usr/bin
}

package() {
	cd ${srcdir}"/"${pkgname^}
	install -dm755 "${pkgdir}/usr/local/share/${pkgname}/resources/"
	install -dm755 "${pkgdir}/usr/bin/"
	mv hhh	${pkgdir}/usr/bin/${pkgname}
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -DTm644 ${startdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -DTm644 ${startdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	cp -r resources/* "${pkgdir}/usr/local/share/${pkgname}/resources/" 
  chmod 644 "${pkgdir}/usr/local/share/hannah/resources/sounds/"*
  chmod 644 "${pkgdir}/usr/local/share/hannah/resources/hannah/"*
}
