# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=git
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
makedepends=("git")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=("git+http://github.com/DisableGraphics/Korai.git" "https://raw.githubusercontent.com/DisableGraphics/Korai/main/src/icon.xpm")
sha512sums=("SKIP" "SKIP")
prepare() {
	cd Korai
	make -j$(nproc)
	cd ..
}
package() {
	mkdir -p "${pkgdir}/usr/"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/share/icons/"

	cp Korai/build/* "${pkgdir}/usr/bin/"
	cp icon.xpm "${pkgdir}/usr/share/icons/korai.xpm"

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

