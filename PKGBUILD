# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=0.1.2
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
makedepends=("git")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=('https://github.com/DisableGraphics/Korai/archive/refs/tags/v0.1.2.tar.gz')
sha512sums=('84d15ed8ac81281f80e210ba5ffafe9ed8120c601a2aef70d5129cf63216021614048714df0f4d5e13102c1d1ad6394707cf9ec4af026eed32820642021bccdd')
prepare() {
	tar xf v${pkgver}.tar.gz
	cd ${srcdir}/Korai-${pkgver}/
	make -j$(nproc)
}
package() {
	mkdir -p "${pkgdir}/usr/"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/share/icons/"

	cp ${srcdir}/Korai-${pkgver}/build/korai "${pkgdir}/usr/bin/"
	cp ${srcdir}/Korai-${pkgver}/src/icon.xpm "${pkgdir}/usr/share/icons/korai.xpm"

	mkdir -p "${pkgdir}/usr/share/applications/"

	if [ -f "${pkgdir}/usr/share/applications/korai.desktop" ]; then
		rm -f "${pkgdir}/usr/share/applications/korai.desktop"
	fi
	touch "${pkgdir}/usr/share/applications/korai.desktop"
	echo "#!/usr/bin/env xdg-open
	[Desktop Entry]
	Version=Git
	Type=Application
	Name=Korai
	Comment=\"Fast, reliable and feature-packed manga/comic book reader\"
	Exec=/usr/bin/korai
	Icon=/usr/share/icons/korai.xpm
	Path=/home/$USER/.local/share
	Terminal=false
	StartupNotify=false
	Categories=Network;" >> "${pkgdir}/usr/share/applications/korai.desktop"
}

