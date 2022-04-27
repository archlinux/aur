# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=0.1.1
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
makedepends=("git")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=('https://github.com/DisableGraphics/Korai/archive/refs/tags/v0.1.1.tar.gz')
sha512sums=('9c3b91edc7fd01b8d25b3c21f67c72693363fb6577c8480b30c9212fadb530ee46754de8df76144d0b0f620140a492184f1fc333b55306e34f0ed34e4421e6ed')
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

