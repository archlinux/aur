# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=lyricsfinder
pkgver=1.6.3
pkgrel=2
pkgdesc="A cross-platform lyrics fetcher by Mediahuman"
arch=('x86_64')
options=('!emptydirs')
url="https://www.mediahuman.com/lyrics-finder"
license=('custom')
depends=( taglib1 qt5-quickcontrols2 qt5-multimedia qt5-declarative qt5-base )

source=('https://www.mediahuman.com/download/LyricsFinder.amd64.deb')
sha512sums=('385e4c816279c12a1ac0410084b9ef0fd821379c2dba6d77eed7eb662678458d34dbd36c5964260c339acbcd3fe84071f0935bbc17fadfe27d4c1f0b43dfb690')

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
