# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=lyricsfinder
pkgver=1.7.0
pkgrel=1
pkgdesc="A cross-platform lyrics fetcher by Mediahuman"
arch=('x86_64')
options=('!emptydirs')
url="https://www.mediahuman.com/lyrics-finder"
license=('custom')
depends=( taglib qt5-quickcontrols2 qt5-multimedia qt5-declarative qt5-base )

source=('https://www.mediahuman.com/download/LyricsFinder.amd64.deb')
sha512sums=('654c1f305716581f8882833f46658a5e29ca73b892c1275057a6357cc0475fb1f41d21d4c69e3c63af2ff59ba13b18036b36b47ccb67ffabf766f0bdd9434ede')

package() {
	tar xf data.tar.zst -C "${pkgdir}"
	chown -R 0:0 ${pkgdir}
	# Binary Placement
	mkdir -p "${pkgdir}/usr/bin/"
	mv ${pkgdir}/opt/lyrics-finder/LyricsFinder ${pkgdir}/usr/bin/lyricsfinder
	# License Info
	mkdir -p "${pkgdir}/usr/share/licenses/"$pkgname"/"
	mv ${pkgdir}/usr/share/doc/lyrics-finder/copyright ${pkgdir}/usr/share/licenses/"$pkgname"/
	# Correct Application Shortcut
    echo '[Desktop Entry]
Name=Lyrics Finder
GenericName=Lyrics
Comment=Search lyrics for your music
Exec=/usr/bin/lyricsfinder %U
Terminal=false
Type=Application
Icon=LyricsFinder
Categories=Audio;
StartupNotify=false' > ${pkgdir}/usr/share/applications/lyrics-finder.desktop
}
