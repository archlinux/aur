# Maintainer: Michel Wohlert <michel.wohlert@gmail.com>

pkgname=games_nebula
pkgver=20180222
pkgrel=1
pkgdesc='Unofficial Linux client for GOG'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/yancharkin/games_nebula'
depends=('python2-gobject' 'python2-beautifulsoup4' 'python2-lxml' 'python2-pillow' 'innoextract' 'htmlcxx' 'lgogdownloader' 'xorg-xrandr')
makedepends=()
optdepends=('gksu' 'xterm' 'curl' 'tar' 'p7zip' 'cabextract' 'unshield' 'ffmpeg' 'wine' 'winetricks' 'dosbox' 'scummvm' 'megatools')
provides=('games_nebula')
conflicts=('games_nebula')
source=(${pkgname}_${pkgver}.tar.gz::"https://github.com/yancharkin/${pkgname}/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('060d34f3bb58910fe26c7737a741832d17057a88bea40acfeb2b2935cfec9efa')

build() {
	cd "${srcdir}"
	mkdir -p games_nebula
	tar -xzf "${pkgname}_${pkgver}.tar.gz" -C ./games_nebula/

}

package() {
	mkdir -p "$pkgdir/opt/${pkgname}/"
	cp -dr --no-preserve=ownership "$srcdir/${pkgname}/." "$pkgdir/opt/${pkgname}/"
        
        install -dm755 "${pkgdir}/usr/bin"
	echo '#!/bin/bash
	python2 "/opt/games_nebula/games_nebula.py"' > "${pkgdir}/usr/bin/${pkgname}"
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
	
	install -dm755 "${pkgdir}/usr/share/applications/"
	echo "[Desktop Entry]
	Name=Games Nebula
	Comment=Application for managing and playing games
	Exec=/usr/bin/${pkgname}
	Icon=/opt/${pkgname}/images/icon.png
	Type=Application
	Terminal=false
	Categories=Game;" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

