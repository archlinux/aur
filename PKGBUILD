# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=lyricsfinder
pkgver=1.5.4
pkgrel=2
pkgdesc="A cross-platform lyrics fetcher by Mediahuman"
arch=( 'x86_64' )
options=('!emptydirs')
url="https://www.mediahuman.com/lyrics-finder"
license=('custom')
depends=( taglib qt5-declarative qt5-base glibc gcc-libs zlib libglvnd libpng harfbuzz md4c krb5 openssl systemd-libs double-conversion icu pcre2 zstd glib2 freetype2 graphite e2fsprogs keyutils xz lz4 libcap libgcrypt pcre libx11 bzip2 libgpg-error libxcb libxau libxdmcp )

source=('https://www.mediahuman.com/download/LyricsFinder.amd64.deb')
sha512sums=('43ea9d61e5f5d6f8306c57325f2bcb69a0b52420846466952d8c968554d94902116d5603e1e162bfdbbc84cc6a9a58de4ec958f11f054b40c406bee5edae70ea')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
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
Categories=Network;
StartupNotify=false' > ${pkgdir}/usr/share/applications/lyrics-finder.desktop

}
