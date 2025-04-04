# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=lyricsfinder
pkgver=1.6.1
pkgrel=1
pkgdesc="A cross-platform lyrics fetcher by Mediahuman"
arch=('x86_64')
options=('!emptydirs')
url="https://www.mediahuman.com/lyrics-finder"
license=('custom')
depends=( taglib1 qt5-multimedia qt5-quickcontrols qt5-declarative qt5-base glibc gcc-libs zlib libglvnd libpng harfbuzz md4c krb5 openssl double-conversion icu pcre2 zstd glib2 freetype2 graphite e2fsprogs keyutils xz lz4 libcap libgcrypt pcre libx11 bzip2 libgpg-error libxcb libxau libxdmcp )

source=('https://www.mediahuman.com/download/LyricsFinder.amd64.deb')
sha512sums=('f6c282ae00865b3e90feeae08652eab29d1ad040cdec82e01984137a611e37838ecf685daa7e32f43280d2358fdc0806f6832d5b1d792c7a07d189b63bbf90e5')

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
